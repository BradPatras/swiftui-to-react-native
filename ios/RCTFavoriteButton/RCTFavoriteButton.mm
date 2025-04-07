//
//  RTCFavoriteButton.m
//  react-native-swiftui
//
//  Created by Brad Patras on 4/4/25.
//

#import "RCTFavoriteButton.h"
#import "ABAnimatedButton.h"
#import <react/renderer/components/NativeEventSenderSpec/ComponentDescriptors.h>
#import <react/renderer/components/NativeEventSenderSpec/EventEmitters.h>
#import <react/renderer/components/NativeEventSenderSpec/Props.h>
#import <react/renderer/components/NativeEventSenderSpec/RCTComponentViewHelpers.h>

using namespace facebook::react;

@interface RCTFavoriteButton () <RCTFavoriteButtonViewProtocol>
@end

@implementation RCTFavoriteButton {
	BOOL _isFavorite;
	ABAnimatedButton * _button;
}

-(instancetype)init
{
	if(self = [super init]) {
		_isFavorite = false;
		_button = [ABAnimatedButton buttonWithAnimationType:ABAnimationTypeBounce];
		[_button addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPress)]];
		//[self updateButton:_isFavorite];
		[self updateButton:false];

		[self addSubview:_button];
	}
	return self;
}

- (void)onPress
{
	self.eventEmitter.onFavoriteTapped(FavoriteButtonEventEmitter::OnFavoriteTapped(_isFavorite));
}

- (const FavoriteButtonEventEmitter &)eventEmitter
{
	return static_cast<const FavoriteButtonEventEmitter &>(*_eventEmitter);
}

- (void)updateButton:(BOOL)isFavorite
{
	if (_isFavorite) {
		_button.backgroundColor = [UIColor clearColor];
		[_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
		[_button setTitle:@"Remove from favorites" forState:UIControlStateNormal];
	} else {
		_button.backgroundColor = [[UIColor magentaColor] colorWithProminence: UIColorProminenceSecondary];
		[_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[_button setTitle:@"Add to favorites" forState:UIControlStateNormal];
	}
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
	const auto &oldViewProps = *std::static_pointer_cast<FavoriteButtonProps const>(_props);
	const auto &newViewProps = *std::static_pointer_cast<FavoriteButtonProps const>(props);

	// Handle your props here
	if (newViewProps.isFavorite != oldViewProps.isFavorite) {
		_isFavorite = newViewProps.isFavorite;
		[self updateButton:_isFavorite];
	}

	[super updateProps:props oldProps:oldProps];
}

-(void)layoutSubviews
{
	[super layoutSubviews];
	_button.frame = self.bounds;
	_button.layer.cornerRadius = self.bounds.size.height / 2;
	_button.clipsToBounds = YES;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
	return concreteComponentDescriptorProvider<FavoriteButtonComponentDescriptor>();
}

@end
