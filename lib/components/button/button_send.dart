import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../base.dart';

class ButtonSend extends ConsumerWidget {
  final VoidCallback? onPressed;

  const ButtonSend({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, ref) {
    return fl.FilledButton(
      onPressed: onPressed,
      child: Text(
        S.current.send,
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ButtonSending extends ConsumerWidget {
  final VoidCallback? onPressed;

  const ButtonSending({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, ref) {
    return fl.IconButton(
      onPressed: onPressed,
      icon: const fl.Icon(
        fl.FluentIcons.circle_stop_solid,
        size: 24.0,
        color: fl.Colors.warningPrimaryColor,
      ),
      iconButtonMode: fl.IconButtonMode.large,
    );
  }
}
