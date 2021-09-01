library overlay_support;

export 'package:eshop_flutter/core/toast/notification/notification.dart';
export 'package:eshop_flutter/core/toast/notification/overlay_notification.dart';
export 'package:eshop_flutter/core/toast/overlay.dart';
export 'package:eshop_flutter/core/toast/overlay_keys.dart' hide KeyedOverlay;
export 'package:eshop_flutter/core/toast/theme.dart';
export 'package:eshop_flutter/core/toast/toast/toast.dart';
export 'package:eshop_flutter/core/toast/overlay_state_finder.dart' hide findOverlayState, OverlaySupportState;

/// The length of time the notification is fully displayed.
Duration kNotificationDuration = const Duration(milliseconds: 2000);

/// Notification display or hidden animation duration.
Duration kNotificationSlideDuration = const Duration(milliseconds: 300);
