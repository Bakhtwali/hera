// institute_profile_model

class InstituteProfileModel {
  String? id;
  String? instituteName;
  String? district;
  String? completeAddress;
  String? universityType;
  DateTime? createat;
  String? instituteType;
  String? displineType;
  DateTime? firstRegistrationDateWithHera;

  String? websiteLink;
  String? officialNumber;
  String? whatsappNumber;
  String? email;
  String? statusOfRegistration;
  String? ownerName;
  String? ownerPhoneName;
  String? directorName;
  String? directorQualification;

  ///------> 2

  String? heraCertificate;
  String? publicSectorUniversityCertificate;
  String? counilAffiationCertificate;
  String? instituteLogo;

  ///------> 3
  String? totalClasses;
  String? totalmaleStudents;
  String? totalfemaleStudents;
  String? totalNmdStudents;
  String? totalScholarshipadvertised;
  String? totalScholarshipawarded;
  String? totalFaculty;

  ///------> 4
  String? totalComplaintlodgedOnPCP;
  String? totalComplaintEmailedOrOtherSource;
  String? totalSolvedComplaints;
  String? totalUnSolvedComplaints;

  InstituteProfileModel({
    this.id,
    this.instituteName,
    this.district,
    this.completeAddress,
    this.universityType,
    this.createat,
    this.firstRegistrationDateWithHera,
    this.instituteType,
    this.displineType,
    this.websiteLink,
    this.officialNumber,
    this.whatsappNumber,
    this.email,
    this.statusOfRegistration,
    this.ownerName,
    this.ownerPhoneName,
    this.directorName,
    this.directorQualification,
    this.heraCertificate,
    this.publicSectorUniversityCertificate,
    this.counilAffiationCertificate,
    this.instituteLogo,
    this.totalClasses,
    this.totalmaleStudents,
    this.totalfemaleStudents,
    this.totalNmdStudents,
    this.totalScholarshipadvertised,
    this.totalScholarshipawarded,
    this.totalFaculty,
    this.totalComplaintlodgedOnPCP,
    this.totalComplaintEmailedOrOtherSource,
    this.totalSolvedComplaints,
    this.totalUnSolvedComplaints,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['instituteName'] = instituteName;
    data['district'] = district;
    data['completeAddress'] = completeAddress;
    data['universityType'] = universityType;
    data['createat'] = createat;
    data['firstRegistrationDateWithHera'] = firstRegistrationDateWithHera;
    data['instituteType'] = instituteType;
    data['displineType'] = displineType;

    data['websiteLink'] = websiteLink;
    data['officialNumber'] = officialNumber;
    data['whatsappNumber'] = whatsappNumber;
    data['email'] = email;
    data['statusOfRegistration'] = statusOfRegistration;
    data['ownerName'] = ownerName;
    data['ownerPhoneName'] = ownerPhoneName;
    data['directorName'] = directorName;
    data['directorQualification'] = directorQualification;

    data['heraCertificate'] = heraCertificate;
    data['publicSectorUniversityCertificate'] =
        publicSectorUniversityCertificate;
    data['counilAffiationCertificate'] = counilAffiationCertificate;
    data['instituteLogo'] = instituteLogo;

    data['totalClasses'] = totalClasses;
    data['totalmaleStudents'] = totalmaleStudents;
    data['totalfemaleStudents'] = totalfemaleStudents;
    data['totalNmdStudents'] = totalNmdStudents;
    data['totalScholarshipadvertised'] = totalScholarshipadvertised;
    data['totalScholarshipawarded'] = totalScholarshipawarded;
    data['totalFaculty'] = totalFaculty;

    data['totalComplaintlodgedOnPCP'] = totalComplaintlodgedOnPCP;
    data['totalComplaintEmailedOrOtherSource'] =
        totalComplaintEmailedOrOtherSource;
    data['totalSolvedComplaints'] = totalSolvedComplaints;
    data['totalUnSolvedComplaints'] = totalUnSolvedComplaints;
    return data;
  }

  InstituteProfileModel.fromJson(json, id) {
    this.id = id;
    instituteName = json['instituteName'];
    district = json['district'];
    completeAddress = json['completeAddress'];
    universityType = json['universityType'];
    createat = json['createat'].toDate();
    firstRegistrationDateWithHera = json['firstRegistrationDateWithHera'].toDate();
    instituteType = json['instituteType'];
    displineType = json['displineType'];

    websiteLink = json['websiteLink'];
    officialNumber = json['officialNumber'];
    whatsappNumber = json['whatsappNumber'];
    email = json['email'];
    statusOfRegistration = json['statusOfRegistration'];
    ownerName = json['ownerName'];
    ownerPhoneName = json['ownerPhoneName'];
    directorName = json['directorName'];
    directorQualification = json['directorQualification'];

    heraCertificate = json['heraCertificate'];
    publicSectorUniversityCertificate =
        json['publicSectorUniversityCertificate'];
    counilAffiationCertificate = json['counilAffiationCertificate'];
    instituteLogo = json['instituteLogo'];

    totalClasses = json[''];
    totalmaleStudents = json['totalmaleStudents'];
    totalfemaleStudents = json['totalfemaleStudents'];
    totalNmdStudents = json['totalNmdStudents'];
    totalScholarshipadvertised = json['totalScholarshipadvertised'];
    totalScholarshipawarded = json['totalScholarshipawarded'];
    totalFaculty = json['totalFaculty'];

    totalComplaintlodgedOnPCP = json['totalComplaintlodgedOnPCP'];
    totalComplaintEmailedOrOtherSource =
        json['totalComplaintEmailedOrOtherSource'];
    totalSolvedComplaints = json['totalSolvedComplaints'];
    totalUnSolvedComplaints = json['totalUnSolvedComplaints'];
  }
}
