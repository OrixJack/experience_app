import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalize_experience_state.freezed.dart';

@freezed
abstract class PersonalizeExperienceState with _$PersonalizeExperienceState {
  const factory PersonalizeExperienceState({
    @Default([]) List<String> selectedInterests,
  }) = _PersonalizeExperienceState;
}
