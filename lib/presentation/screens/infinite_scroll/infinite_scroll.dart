import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!context.mounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastIds = imagesId.last;

    imagesId.addAll(
      List.generate(5, (index) => lastIds + index),
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    if (context.mounted) {
      setState(() {});
    }
    await Future.delayed(const Duration(seconds: 3));

    final lastId = imagesId.last;

    imagesId.clear();

    imagesId.add(lastId + 1);
    isLoading = false;

    if (context.mounted) {
      setState(() {});
    }

    addFiveImages();
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: _Layout(
          scrollController: scrollController,
          imagesId: imagesId,
          onRefresh: () {
            return onRefresh();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout(
      {required this.scrollController,
      required this.imagesId,
      required this.onRefresh});

  final ScrollController scrollController;
  final List<int> imagesId;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 10,
      strokeWidth: 2,
      onRefresh: onRefresh,
      child: ListView.builder(
          controller: scrollController,
          itemCount: imagesId.length,
          itemBuilder: (context, index) {
            return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesId[index]}/500/300'));
          }),
    );
  }
}
