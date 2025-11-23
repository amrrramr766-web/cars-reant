import 'package:bloc/bloc.dart';

class OnBordingCubit extends Cubit<int> {
  OnBordingCubit() : super(0) {
    print('🚀 [OnBoardingCubit] OnBoardingCubit initialized');
  }

  /// Move to next index if available
  int nextIndex(int itemCount) {
    final newIndex = (state < itemCount - 1) ? state + 1 : state;
    print(
      '➡️  [OnBoardingCubit] nextIndex() called - current: $state, new: $newIndex, total: $itemCount',
    );
    emit(newIndex);
    return newIndex;
  }

  /// Update index directly
  void updateIndex(int index) {
    print(
      '🔇 [OnBoardingCubit] updateIndex() called - setting index to: $index',
    );
    emit(index);
  }
}
