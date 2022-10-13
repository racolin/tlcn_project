class RowHeader {
  final List<String> headers;

  RowHeader(this.headers);
}



class ItemRow {
  int _columnCounts = 0;

  int get columnCounts => _columnCounts;
}

class Member {
  final String image;
  final String name;

  Member({required this.image, required this.name});
}

class MemberRow extends ItemRow {
  final Member member;
  final String phone;
  final MemberType memberType;

  MemberRow(
    this.member,
    this.phone,
    this.memberType,
  ) {
    _columnCounts = 3;
  }
}

enum MemberType { bronze, sliver, gold, diamond }

class ListRow<T extends ItemRow> {
  final List<int> rate;
  final RowHeader header;
  final List<T> rows;

  ListRow({required this.header, required this.rows, required this.rate,});

  bool isMatchColumn() {
    return rows.isEmpty
        ? true
        : (rows[0].columnCounts == header.headers.length) &&
            (header.headers.length == rate.length);
  }
}

// main() {
//   ListRow<MemberRow> listRow = ListRow(
//     header: RowHeader(['A', 'B', 'C', 'D']),
//     rows: [
//       MemberRow(
//         'image',
//         'name',
//         'phone',
//         MemberType.bronze,
//       ),
//     ],
//   );
//
//   listRow.isMatchColumn();
// }
