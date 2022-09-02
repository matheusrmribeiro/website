import 'package:flutter/widgets.dart';

class ChangeObserver<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeObserver({
    Key? key,
    required this.value,
    required this.builder,
  }) : super(key: key);

  final T value;

  final Widget Function(BuildContext context, T value) builder;

  @override
  _ChangeObserverState<T> createState() =>
      _ChangeObserverState<T>();
}

class _ChangeObserverState<T extends ChangeNotifier>
    extends State<ChangeObserver<T>> {
  @override
  void initState() {
    widget.value.addListener(_listener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeObserver<T> oldWidget) {
    if (widget.value != oldWidget.value) {
      _miggrate(widget.value, oldWidget.value, _listener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.value.removeListener(_listener);
    super.dispose();
  }

  void _miggrate(Listenable a, Listenable b, void Function() listener) {
    a.addListener(listener);
    b.removeListener(listener);
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.value);
  }
}