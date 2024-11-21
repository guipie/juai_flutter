import '../../../base.dart';

class PassWordWidget extends StatelessWidget {
  const PassWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: S.current.pwd,
          filled: true,
          fillColor: const Color(0xFFF5FCF9),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onSaved: (passaword) {
          // Save it
        },
      ),
    );
  }
}
