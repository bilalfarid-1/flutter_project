import 'package:flutter/material.dart';

class QuantityInput extends StatefulWidget {
  final int maxQty;
  final ValueChanged<int> onChanged;
  QuantityInput({super.key, required this.maxQty, required this.onChanged});

  @override
  State<QuantityInput> createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  final TextEditingController _controller = TextEditingController(text: '0');
  int _quantity = 0;

  void setQuantity(int value) {
    if (value < 0) value = 0;
    if (value > widget.maxQty) value = widget.maxQty;

    _quantity = value;
    _controller.text = _quantity.toString();
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );

    widget.onChanged(_quantity);
  }

  void getText() {
    final parsed = int.tryParse(_controller.text) ?? 0;
    setQuantity(parsed);
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
          // minus button
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              icon: const Icon(Icons.remove),
              onPressed: _quantity > 0
                  ? () {
                      setState(() {
                        setQuantity(_quantity - 1);
                      });
                    }
                  : null,
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
              onChanged: (_) {
                setState(getText);
              },
            ),
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              icon: const Icon(Icons.add),
              onPressed: _quantity < widget.maxQty
                  ? () {
                      setState(() {
                        setQuantity(_quantity + 1);
                      });
                    }
                  : null,
            ),
          ),
          const SizedBox(width: 8),
          // label to clarify what the counter is for
          Text(
            _quantity == 1 ? 'person' : 'persons',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
