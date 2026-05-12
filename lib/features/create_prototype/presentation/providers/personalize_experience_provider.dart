import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:experience_app/features/create_prototype/presentation/states/personalize_experience_state.dart';

final personalizeExperienceProvider =
    StateNotifierProvider<
      PersonalizeExperienceNotifier,
      PersonalizeExperienceState
    >((ref) {
      return PersonalizeExperienceNotifier();
    });

class PersonalizeExperienceNotifier
    extends StateNotifier<PersonalizeExperienceState> {
  PersonalizeExperienceNotifier() : super(const PersonalizeExperienceState());

  void toggleInterest(String interest) {
    final isSelected = state.selectedInterests.contains(interest);

    if (isSelected) {
      state = state.copyWith(
        selectedInterests: state.selectedInterests
            .where((i) => i != interest)
            .toList(),
      );
    } else {
      state = state.copyWith(
        selectedInterests: [...state.selectedInterests, interest],
      );
    }
  }

  bool isInterestSelected(String interest) {
    return state.selectedInterests.contains(interest);
  }

  List<String> getSelectedInterests() {
    return state.selectedInterests;
  }
}
