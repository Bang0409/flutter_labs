import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
      'Xe của bạn bị xẹp lốp trên một con đường vắng. '
          'Bạn quyết định đi nhờ xe. Một chiếc xe tải màu đen '
          'dừng lại bên cạnh bạn. Một người đàn ông với đôi mắt '
          'vô hồn mở cửa xe và hỏi: "Cần đi nhờ không?"',
      choice1: 'Đồng ý đi nhờ. Cảm ơn vì sự giúp đỡ!',
      choice2: 'Khoan đã, tốt hơn là tôi nên hỏi anh ta vài câu trước.',
    ),
    Story(
      storyTitle:
      'Người đàn ông gật đầu chậm rãi. Khi bạn bước lên xe, '
          'bạn nhận thấy cửa xe không có tay nắm ở phía trong.',
      choice1: 'Giữ bình tĩnh và tiếp tục chuyến đi.',
      choice2: 'Cố gắng mở cửa và thoát ra ngoài.',
    ),
    Story(
      storyTitle:
      'Bạn hỏi người đàn ông đang đi đâu. Anh ta im lặng '
          'và tiếp tục lái xe vào một con đường tối.',
      choice1: 'Yêu cầu anh ta dừng xe ngay.',
      choice2: 'Im lặng và quan sát xung quanh.',
    ),
    Story(
      storyTitle:
      'Bạn giữ bình tĩnh. Một lúc sau chiếc xe dừng trước '
          'một trạm xăng đông người. Bạn nhanh chóng xuống xe và an toàn.',
      choice1: 'Bắt đầu lại',
      choice2: '',
    ),
    Story(
      storyTitle:
      'Bạn mở được cửa xe và nhảy xuống khi xe đang chạy chậm. '
          'Bạn chạy đến một cửa hàng gần đó và được giúp đỡ.',
      choice1: 'Bắt đầu lại',
      choice2: '',
    ),
    Story(
      storyTitle:
      'Người đàn ông bất ngờ dừng xe. Bạn nhìn thấy ánh đèn '
          'của một khu dân cư phía trước và tìm được đường về an toàn.',
      choice1: 'Bắt đầu lại',
      choice2: '',
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 1;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 2) {
      _storyNumber = 5;
    } else {
      restart();
    }
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }

  void restart() {
    _storyNumber = 0;
  }
}