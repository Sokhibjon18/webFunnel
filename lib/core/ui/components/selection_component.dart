import 'package:flutter/material.dart';
import 'package:web_funnel/core/constants/app_colors.dart';
import 'package:web_funnel/core/ui/widgets/component_wrapper.dart';

class SelectionComponent extends StatefulWidget {
  const SelectionComponent({
    super.key,
    this.backgroundColor = AppColors.componentsBackground,
    required this.dropdownItems,
    required this.defaultSelectedValue,
    required this.onValueChanged,
    required this.selectionText,
  });

  final Color backgroundColor;
  final List<String> dropdownItems;
  final String defaultSelectedValue;
  final ValueChanged<String> onValueChanged;
  final String selectionText;

  @override
  State<SelectionComponent> createState() => _SelectionComponentState();
}

class _SelectionComponentState extends State<SelectionComponent> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultSelectedValue;
  }

  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    overflow: TextOverflow.ellipsis,
  );

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      backgroundColor: widget.backgroundColor,
      text: widget.selectionText,
      child: DropdownButton<String>(
        value: selectedValue,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textPrimary,
          size: 20,
        ),
        dropdownColor: AppColors.componentsBackground,
        underline: const SizedBox.shrink(),
        borderRadius: BorderRadius.circular(8),
        padding: EdgeInsets.zero,
        style: textStyle,
        items: widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: textStyle),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onValueChanged(newValue);
          }
        },
      ),
    );
  }
}
