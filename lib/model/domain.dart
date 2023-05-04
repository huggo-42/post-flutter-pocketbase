// {
// "id": "cxscynfzdunp100",
// "created": "2023-05-04 14:55:36.722Z",
// "updated": "2023-05-04 14:57:46.751Z",
// "collectionId": "xahm6s25mfzqacl",
// "collectionName": "domains",
// "expand": {},
// "description": "Domaindful domain ",
// "domain": "domaindful.com",
// "plataform": "ohcben00evscr41",
// "price": 0,
// "register_date": "2022-05-04 12:00:00.000Z",
// "register_time": 2,
// "renew_url": "domaindful.com/renew",
// "title": "domaindful.com",
// "user": "h4wvzza79au3zww"
// }
class Domain {
  final String domain;

  Domain({required this.domain});

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(domain: json['domain']);
  }
}
