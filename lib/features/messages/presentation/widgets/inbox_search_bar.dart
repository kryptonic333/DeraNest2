import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:deranest/features/messages/data/stream_provider/stream_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InboxSearchBar extends ConsumerWidget {
  const InboxSearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    return CustomTextField(
      fontColor: AppColors.kBlack,
      enabledBorderColor: AppColors.kWhite,
      focusedBorderColor: AppColors.kWhite,
      hintTextColor: AppColors.kBlack,
      filled: true,
      contentPadding: const EdgeInsets.all(10),
      onSubmitted: (val) => FocusScope.of(context).unfocus(),
      fillColor: AppColors.kHintTextColor.withAlpha(50),
      onTap: () {},
      cursorColor: AppColors.kBlack,
      isPrefixIconEnabled: true,
      preFixIcon: Icons.search,
      controller: chatState.searchController,
      labelText: null,
      keyboardType: TextInputType.name,
      validator: null,
      textInputAction: TextInputAction.done,
      hintText: 'Search',
    ).padAll(context.h(1.5));
  }
}
