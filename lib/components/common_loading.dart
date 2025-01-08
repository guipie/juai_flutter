import '../base/base.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        alignment: Alignment.center,
        child: const SizedBox(
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.tips});
  final String? tips;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/empty.png', width: 96, height: 130, fit: BoxFit.cover),
          Transform.translate(offset: const Offset(0, -10), child: Text(tips ?? S.current.empty_content_need_add, style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}
