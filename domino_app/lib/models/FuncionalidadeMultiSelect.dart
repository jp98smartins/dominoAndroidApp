import 'package:flutter/material.dart';
import 'package:domino_app/models/FuncionalidadeMultiSelectDialog.dart';

class FuncionalidadeMultiSelect extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final Color fillColor;
  final InputBorder border;

  FuncionalidadeMultiSelect(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      dynamic initialValue,
      bool autovalidate = false,
      this.titleText = '',
      this.hintText = '',
      this.required = false,
      this.errorText = 'Selecione uma ou mais opções!',
      this.leading,
      this.dataSource,
      this.textField,
      this.valueField,
      this.change,
      this.open,
      this.close,
      this.fillColor,
      this.border,
      this.trailing})
      : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<dynamic> state) {
            List<Widget> _buildSelectedOptions(state) {
              List<Widget> selectedOptions = [];

              if (state.value != null) {
                state.value.forEach((item) {
                  var existingItem = dataSource.singleWhere((itm) => itm[valueField] == item, orElse: () => null);
                  selectedOptions.add(
                  Chip(
                    elevation: 4.0,
                    backgroundColor: Colors.cyan[900],
                    label: Text(
                      existingItem[textField], 
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis
                    ),
                  ));
                });
              }

              return selectedOptions;
            }

            return InkWell(
              onTap: () async {
                List initialSelected = state.value;
                if (initialSelected == null) {
                  initialSelected = List();
                }

                final items = List<FuncionalidadeMultiSelectDialogItem<dynamic>>();
                dataSource.forEach((item) {
                  items.add(FuncionalidadeMultiSelectDialogItem(item[valueField], item[textField]));
                });

                List selectedValues = await showDialog<List>(
                  context: state.context,
                  builder: (BuildContext context) {
                    return FuncionalidadeMultiSelectDialog(
                      title: titleText,
                      items: items,
                      initialSelectedValues: initialSelected,
                    );
                  },
                );

                if (selectedValues != null) {
                  state.didChange(selectedValues);
                  state.save();
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  errorText: state.hasError ? state.errorText : null,
                  errorMaxLines: 4,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                isEmpty: state.value == null || state.value == '',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          required
                            ? Padding(padding:EdgeInsets.only(top:5, right: 5), child: Text(
                                ' *',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 17.0,
                                ),
                              ),
                            )
                            : Container(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black54,
                              size: 26.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    state.value != null && state.value.length > 0
                    ? Wrap(
                        spacing: 8.0,
                        runSpacing: 0.0,
                        children: _buildSelectedOptions(state),
                      )
                    : new Container(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        hintText,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
}
