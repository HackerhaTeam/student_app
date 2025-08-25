import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class HomeSearchSection extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onClear;

  const HomeSearchSection({
    super.key,
    required this.searchController,
    this.onSearch,
    this.onClear,
  });

  @override
  State<HomeSearchSection> createState() => _HomeSearchSectionState();
}

class _HomeSearchSectionState extends State<HomeSearchSection> {
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    widget.searchController.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    widget.searchController.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    if (widget.onSearch != null) {
      widget.onSearch!(widget.searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: CustomTextField(
        fieldType: FieldType.search,
        hint: "ابحث عن اسم مادة",
        radius: 8.r(context),
        prefix: PhosphorIcon(PhosphorIcons.magnifyingGlass()),
        suffix: widget.searchController.text.isNotEmpty
            ? PhosphorIcon(PhosphorIcons.xCircle())
            : null,
        controller: widget.searchController,
        focusNode: _searchFocusNode,
        onFieldSubmitted: (value) {
          if (widget.onSearch != null) {
            widget.onSearch!(value);
          }
        },
      ),
    );
  }
}
