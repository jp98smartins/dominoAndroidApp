import 'package:flutter/material.dart';

class FuncionalidadeMultiSelectDialogItem<V> {
  const FuncionalidadeMultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class FuncionalidadeMultiSelectDialog<V> extends StatefulWidget {
  FuncionalidadeMultiSelectDialog(
      {Key key, this.items, this.initialSelectedValues, this.title})
      : super(key: key);

  final List<FuncionalidadeMultiSelectDialogItem<V>> items;
  final List<V> initialSelectedValues;
  final String title;

  @override
  State<StatefulWidget> createState() => _FuncionalidadeMultiSelectDialogState<V>();
}

class _FuncionalidadeMultiSelectDialogState<V> extends State<FuncionalidadeMultiSelectDialog<V>> {
  final _selectedValues = List<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.cyan[900], width: 5.0),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 15.0, right: 10.0),
          child: SizedBox(
            height: 40.0,
            child: RaisedButton(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.cyan[900], width: 2.0),
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.clear,
                      color: Colors.cyan[900],
                      size: 24.0,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5.0)),
                    Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.cyan[900],
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              onPressed: _onCancelTap,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 15.0, right: 10.0),
          child: SizedBox(
            height: 40.0,
            child: RaisedButton(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.cyan[900]),
              ),
              color: Colors.cyan[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5.0)),
                    Text(
                      'Selecionar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              onPressed: _onSubmitTap,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(FuncionalidadeMultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}
