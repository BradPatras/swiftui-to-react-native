/**
 * This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
 *
 * Do not edit this file as changes may cause incorrect behavior and will be lost
 * once the code is regenerated.
 *
 * @generated by codegen project: GenerateModuleH.js
 */

#pragma once

#include <ReactCommon/TurboModule.h>
#include <react/bridging/Bridging.h>

namespace facebook::react {


  class JSI_EXPORT NativeVectorIconsCxxSpecJSI : public TurboModule {
protected:
  NativeVectorIconsCxxSpecJSI(std::shared_ptr<CallInvoker> jsInvoker);

public:
  virtual jsi::Value getImageForFont(jsi::Runtime &rt, jsi::String fontFamilyName, jsi::String glyph, double fontSize, double color) = 0;
  virtual jsi::String getImageForFontSync(jsi::Runtime &rt, jsi::String fontFamilyName, jsi::String glyph, double fontSize, double color) = 0;

};

template <typename T>
class JSI_EXPORT NativeVectorIconsCxxSpec : public TurboModule {
public:
  jsi::Value create(jsi::Runtime &rt, const jsi::PropNameID &propName) override {
    return delegate_.create(rt, propName);
  }

  std::vector<jsi::PropNameID> getPropertyNames(jsi::Runtime& runtime) override {
    return delegate_.getPropertyNames(runtime);
  }

  static constexpr std::string_view kModuleName = "VectorIcons";

protected:
  NativeVectorIconsCxxSpec(std::shared_ptr<CallInvoker> jsInvoker)
    : TurboModule(std::string{NativeVectorIconsCxxSpec::kModuleName}, jsInvoker),
      delegate_(reinterpret_cast<T*>(this), jsInvoker) {}


private:
  class Delegate : public NativeVectorIconsCxxSpecJSI {
  public:
    Delegate(T *instance, std::shared_ptr<CallInvoker> jsInvoker) :
      NativeVectorIconsCxxSpecJSI(std::move(jsInvoker)), instance_(instance) {

    }

    jsi::Value getImageForFont(jsi::Runtime &rt, jsi::String fontFamilyName, jsi::String glyph, double fontSize, double color) override {
      static_assert(
          bridging::getParameterCount(&T::getImageForFont) == 5,
          "Expected getImageForFont(...) to have 5 parameters");

      return bridging::callFromJs<jsi::Value>(
          rt, &T::getImageForFont, jsInvoker_, instance_, std::move(fontFamilyName), std::move(glyph), std::move(fontSize), std::move(color));
    }
    jsi::String getImageForFontSync(jsi::Runtime &rt, jsi::String fontFamilyName, jsi::String glyph, double fontSize, double color) override {
      static_assert(
          bridging::getParameterCount(&T::getImageForFontSync) == 5,
          "Expected getImageForFontSync(...) to have 5 parameters");

      return bridging::callFromJs<jsi::String>(
          rt, &T::getImageForFontSync, jsInvoker_, instance_, std::move(fontFamilyName), std::move(glyph), std::move(fontSize), std::move(color));
    }

  private:
    friend class NativeVectorIconsCxxSpec;
    T *instance_;
  };

  Delegate delegate_;
};

} // namespace facebook::react
