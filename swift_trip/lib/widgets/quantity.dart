import 'package:flutter/material.dart';

class QuantityInput extends StatefulWidget {
  final int maxQty;
  final ValueChanged<int> onChanged;
  const QuantityInput({super.key, required this.maxQty, required this.onChanged});

  @override
  State<QuantityInput> createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  final TextEditingController _controller = TextEditingController(text: '0');
  int _quantity = 0;

  void updateQuantity() {
    final parsed = int.tryParse(_controller.text);
    int value = parsed ?? 0;
    if (value < 0) value = 0;
    if (value > widget.maxQty) value = widget.maxQty;
    _quantity = value;
    _controller.text = _quantity.toString();
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
      widget.onChanged(_quantity); // send new quantity to parent
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  updateQuantity();
                  if (_quantity > 0) _quantity--;
                  _controller.text = _quantity.toString();
                });
              },
            ),
          ),
          SizedBox(
            width: 40,
            height: 28,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                ),
              ),
              onChanged: (_) => setState(updateQuantity),
            ),
          ),
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  updateQuantity();
                  _quantity++;
                  _controller.text = _quantity.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
