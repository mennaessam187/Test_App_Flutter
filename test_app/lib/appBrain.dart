import 'text.dart';

int _change = 0;

class appbrain {
  List<quiection> _que = [
    quiection(
        "Our solar system has eight planets: Mercury, Venus, Earth,Mars, Jupiter, Saturn, Uranus, and Neptune. Beyond our solar system,there are thousands of exoplanets",
        "images/image-1.jpg",
        true),
    quiection(
        "Cats are small domesticated animals that belong to the feline family. They are known for their agility and hunting skills and are beloved companions to humans due to their independen",
        "images/image-2.jpg",
        true),
    quiection(
        "Geography is the study of the Earth's physical features, its atmosphere, and human activity as it affects and is affected by these, including the distribution of populations and resources,",
        "images/image-3.jpg",
        true),
    quiection(
        "The universe is a vast expanse that includes all of space, time, matter, and energy, originating from the Big Bang approximately 13.8 billion years ago and continuing to expand",
        "images/image-4.jpg",
        false),
    quiection(
        "Vegetables are parts of plants that are usually eaten and are known for being rich in vitamins and minerals",
        "images/image-5.jpg",
        false),
    quiection(
        "The Sun is the star at the center of our solar system. It is a nearly perfect sphere of hot plasma, primarily composed of hydrogen and helium.",
        "images/image-6.jpg",
        false),
    quiection(
        "A chick is a young bird, especially a young domestic chicken. It hatches from an egg and grows quickly, developing feathers and learning to peck for food shortly after birth.",
        "images/image-7.jpg",
        false)
  ];
  void increace() {
    if (_change < _que.length) {
      _change++;
    }
  }

  String gitText() {
    return _que[_change].textof;
  }

  String gitimage() {
    return _que[_change].imageof;
  }

  bool gitcorrectanswer() {
    return _que[_change].correctanswer;
  }

  bool isFinshed() {
    if (_change >= _que.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    _change = 0;
  }
}
