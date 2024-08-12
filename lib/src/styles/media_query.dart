import 'package:jaspr/browser.dart';

/// [MediaQuery] is a class that provides media queries for different devices.
/// It is used to apply different styles to different devices based on their width.
/// The devices are classified into four categories: mobile, tablet, laptop, and desktop.
/// The styles will be applied to devices based on their width.
class MediaQuery {
  MediaQuery._();

  /// !A media query for mobile devices.
  /// !The styles will be applied to devices with a width of 325px to 425px.
  static StyleRule mobile(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 325.px,
        maxWidth: 425.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  //! A media query for tablet devices.
  //! The styles will be applied to devices with a width of 426px to 768px.
  static StyleRule tablet(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 426.px,
        maxWidth: 768.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for laptop devices.
  /// !The styles will be applied to devices with a width of 769px to 1024px.
  static StyleRule laptop(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 769.px,
        maxWidth: 1024.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for desktop devices.
  /// !The styles will be applied to devices with a width of 1025px or more.
  static StyleRule desktop(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 1026.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for mobile and tablet devices.
  /// !The styles will be applied to devices with a width of 325px to 768px.
  static StyleRule mobileAndTablet(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 325.px,
        maxWidth: 768.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for tablet and laptop devices.
  /// !The styles will be applied to devices with a width of 426px to 1024px.
  static StyleRule tabletAndLaptop(List<StyleRule> stlyes) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 426.px,
        maxWidth: 1024.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for laptop and desktop devices.
  /// !The styles will be applied to devices with a width of 769px or more.
  static StyleRule laptopAndDesktop(
    List<StyleRule> stlyes, {
    /// The maximum width of the device in pixels -> [px]
    int? maxWidth,
  }) {
    return StyleRule.media(
      styles: stlyes,
      query: MediaRuleQuery(
        minWidth: 769.px,
        maxWidth: maxWidth?.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }

  /// !A media query for mobile, tablet, and laptop devices.
  /// !The styles will be applied to devices with a width of 325px to 1024px.
  static StyleRule custom({
    required int minWidth,
    int? maxWidth,
    required List<StyleRule> styles,
  }) {
    return StyleRule.media(
      styles: styles,
      query: MediaRuleQuery(
        minWidth: minWidth.px,
        maxWidth: maxWidth?.px,
        target: MediaRuleTarget.screen,
      ),
    );
  }
}
