import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

enum DropdownType {
  university,
  academicYear,
  month,
  gender,
}

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final Function(String) onChanged;
  final DropdownType type;
  final String? label;
  final double radius;
  final double? width;
  final double? height;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.type,
    this.label,
    this.radius = 8,
    this.width,
    this.height,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  final GlobalKey _fieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      switch (widget.type) {
        case DropdownType.university:
          return 'يرجى اختيار الجامعة';
        case DropdownType.academicYear:
          return 'اختر السنة الدراسية التي أنت فيها حالياً، هذا الحقل مطلوب';
        case DropdownType.month:
          return 'يرجى اختيار الشهر';
        case DropdownType.gender:
          return 'يرجى اختيار الجنس';
      }
    }
    return null;
  }

  void _toggleDropdown(FormFieldState<String> fieldState) {
    if (_isDropdownOpen) {
      _removeDropdown();
    } else {
      _showDropdown(fieldState);
    }
  }

  void _showDropdown(FormFieldState<String> fieldState) {
    _overlayEntry = _createOverlayEntry(fieldState);
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
    setState(() => _isDropdownOpen = true);
  }

  void _removeDropdown() {
    _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      setState(() => _isDropdownOpen = false);
    });
  }

  OverlayEntry _createOverlayEntry(FormFieldState<String> fieldState) {
    final renderBox = _fieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _removeDropdown();
        },
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 4),
              child: Material(
                color: Colors.transparent,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SizedBox(
                      width: size.width,
                      child: Material(
                        elevation: 0,
                        color: backgrounds.onSurfacePrimary,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: border.transparent, width: 1),
                          borderRadius: BorderRadius.circular(widget.radius),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.items.map((item) {
                            final isSelected = item == widget.selectedValue;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  fieldState.didChange(item);
                                  widget.onChanged(item);
                                  _removeDropdown();
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (isSelected)
                                      PhosphorIcon(PhosphorIcons.caretRight(),
                                          size: 16,
                                          color: content.brandPrimary),
                                    Text(
                                      item,
                                      textDirection: TextDirection.rtl,
                                      style: styles.xParagraphLargeNormal
                                          .copyWith(
                                              color: isSelected
                                                  ? content.brandPrimary
                                                  : content.primary),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;

    return FormField<String>(
      validator: (value) => _validate(value),
      builder: (FormFieldState<String> fieldState) {
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: () {
                _toggleDropdown(fieldState);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputDecorator(
                    key: _fieldKey,
                    decoration: InputDecoration(
                        labelText: widget.label,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: styles.xLabelSmall.copyWith(
                          color: widget.selectedValue == null
                              ? content.primary
                              : backgrounds.primaryBrand,
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w(context), vertical: 14.h(context)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius),
                          borderSide: BorderSide(color: border.primaryBrand),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius),
                          borderSide: BorderSide(
                            color: widget.selectedValue == null
                                ? border.secondary
                                : backgrounds.primaryBrand,
                            width: widget.selectedValue == null ? 1 : 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius),
                          borderSide: BorderSide(color: border.primaryBrand),
                        ),
                        errorText: fieldState.errorText,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        errorStyle: styles.xParagraphSmall
                        //  const TextStyle(
                        //   fontSize: 12,
                        //   color: Colors.red,
                        //   // height: 0.05,
                        // ),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.selectedValue ?? widget.label ?? "",
                            style: styles.xParagraphLargeNormal.copyWith(
                              color: widget.selectedValue == null
                                  ? Colors.grey
                                  : content.primary,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: content.primary),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
