

class Note {
  int? id;
  String? title;
  String? content;
  String? datatimeEdited;
  String? datatimeCreated;

  Note({
    this.id,
    this.title,
    this.content,
    this.datatimeEdited,
    this.datatimeCreated,
  });

  factory Note.fromJson(data) {
    return Note(
      id: data['id'],
      title: data['title'],
      content: data['content'],
      datatimeEdited: data['datatimeEdited'],
      datatimeCreated: data['datatimeCreated'],
    );
  }

//convert data to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'datatimeEdited': datatimeEdited,
      'datatimeCreated': datatimeCreated,
    };
  }
}
