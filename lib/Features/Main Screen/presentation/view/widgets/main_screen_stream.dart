import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/Features/Main%20Screen/presentation/provider/tasks_provider.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/main_screen_body.dart';

class MainScreenProvider extends ConsumerWidget {
  const MainScreenProvider({super.key, });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsyncValue = ref.watch(tasksStreamProvider);
    
    return RefreshIndicator(
      onRefresh: () => ref.refresh(tasksStreamProvider.future),
      child: tasksAsyncValue.when(
        skipLoadingOnRefresh: false,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (tasks) {
            return MainScreenBody(data : tasks);
          
        },
      ),
    );
  }
}

