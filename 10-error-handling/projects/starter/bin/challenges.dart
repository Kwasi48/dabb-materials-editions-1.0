//challenges

void main() {
  //challenge 1
  final numbers = ['3', 'IE+8', '1.25' 'four', '-0.01', 'NaN', 'Infinity'];
  List<double> nums = [];
  try {
    for (var element in numbers) {
      double erms = double.parse(element);

      nums.add(erms);
    }
  } on FormatException {
    print('It is not a number');
  } finally {
    print(nums);
  }

  //challenge2
  final String postalcode = '1234578';
  checkPostal(postalcode);
}

void checkPostal(String post) {
  final postcheck = RegExp(r'[5]');
  if (!post.contains(postcheck)) {
    throw InvalidPost('Post must contain five digits');
  }
}

class InvalidPost implements Exception {
  InvalidPost(this.message);
  final String message;
}
