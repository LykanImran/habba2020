bool isGuest = false;
String imgURL = '';
/// animation delay
final int delayedAmount = 500;

String aboutUs =
    "Acharya Habba is a Kaleidoscope of talent, expressed through a spectrum of performances which involves music,"
    " dance, drama, sports, technological prodigies with a tinge of competitive air and lots of cheer, diligence and "
    "ecstacy all around us. The fest harbours silver, gold or platinum sponsor titles with perks being "
    "provided accordingly, along with onlookers standing steadfast with awe and admiration at the splendid sight "
    "before them. Battle of the Bands, Fashion Show, and detailed dance styles along with themes keeps one glued "
    "till the end of the fest. It’s the most gala time of the year to welcome the best of moments and creation of "
    "memories. Habba draws in a crowd of 25,000 or more people, with 12,000 in-house attending Habba every year, "
    "with students streaming in from all over the country.";

List<String> collegeList = [
  "Choose your college",
  "ACHARYA INSTITUTE OF TECHNOLOGY",
  "ACHARYA & BM REDDY COLLEGE OF PHARMACY",
  "ACHARYA SCHOOL OF MANAGEMENT",
  "ACHARYA COLLEGE OF EDUCATION",
  "ACHARYA'S NRV SCHOOL OF ARCHITECTURE",
  "ACHARYA SCHOOL OF LAW",
  "ACHARYA INSTITUTE OF GRADUATE STUDIES",
  "SMT. NAGARATHNAMMA SCHOOL OF NURSING",
  "SMT. NAGARATHNAMMA COLLEGE OF NURSING",
  "ACHARYA SCHOOL OF DESIGN",
  "ACHARYA INSTITUTE OF ALLIED HEALTH SCIENCES",
  "ACHARYA INSTITUTE OF PHYSIOTHERAPY AND SPORTS MEDICINE",
  "ACHARYA POLYTECHNIC",
  "ACHARYA PRE UNIVERSITY COLLEGE",
  "ACHARYA INSTITUTE OF ENGLISH & FOREIGN LANGUAGE"
];

Map<String, List<String>> branchMap() {
  return {
    // Engg list
    collegeList[0]: [
      "choose your college first",
    ],
    collegeList[1]: [
      "Aeronautical Engineering",
      "Automobile Engineering",
      "Bio Technology Engineering",
      "Civil Engineering",
      "Computer Science and Engineering ",
      "Electrical and Electronics Engineering",
      "Electronics and Communication Engineering",
      "Information Science and Engineering",
      "Mechanical Engineering",
      "Mechatronics Engineering",
      "Mining Engineering",
      "M.Tech in Computer Science and Engineering",
      "M.Tech in Digital Communication and Engineering",
      "M.Tech in Bio Technology",
      "M.Tech in Machine Design",
    ],
    // pharmacy
    collegeList[2]: [
      "Pharm D Doctor of Pharmacy",
      "Pharm D Post Baccalaureate PharmD",
      "M Pharm Industrial Pharmacy",
      "M Pharm Pharmacology",
      "M Pharm Pharmaceutics",
      "M Pharm Pharmaceutical Chemistry",
      "M Pharm Quality Assurance",
      "M Pharm Pharmaceutical Analysis",
      "M Pharm Pharmacognosy",
      "M Pharm Drug Regulatory Affairs",
      "D Pharm Diploma in Pharmacy",
    ],
    // management
    collegeList[3]: ["PGDM –  Post Graduate Diploma in Management"],
    // college of education
    collegeList[4]: [],
    // architectures
    collegeList[5]: [
      "BACHELOR OF ARCHITECTURE",
    ],
    // law
    collegeList[6]: [
      "BA LLB",
      "BBA LLB",
      "LLB",
    ],
    // graduate studies
    collegeList[7]: [
      "Bachelor Of Business Administration",
      "Bachelor Of Business Administration in Aviation",
      "Bachelor Of Computer Application",
      "Bachelor Of Commerce",
      "Bachelor Of Social Work",
      "Bachelor Of Arts",
      "Bachelor Of Science",
      "Master of Finance and Accounting",
      "Master Of Commerce",
      "Master Of Science in Physics",
      "Master Of Science in Chemistry",
      "Master Of Science in Mathematics",
      "Master Of Science in Psychology",
      "Master Of Arts in English",
      "Master Of Arts in Economics",
    ],
    // school of nursing
    collegeList[8]: ["G.N.M.-Diplomo in general Nursing & Midwifery"],
    // college of nursing
    collegeList[9]: [
      "M.Sc. Nursing"
          "PB B.Sc. Nursing"
          "B.Sc. Nursing"
    ],
    // design
    collegeList[10]: [],
    //ALLIED HEALTH SCIENCES",
    collegeList[11]: [
      "Bachelor Of  Science"
          "Bachelor Of Hospital Administration"
          "Bachelor In Public Health"
    ],
    //  "ACHARYA INSTITUTE OF PHYSIOTHERAPY AND SPORTS MEDICINE",
    collegeList[12]: ["Bachelor Of Physiotherapy"],

    //  "ACHARYA POLYTECHNIC",
    collegeList[13]: [
      "Aeronautical"
          "Apparel Design & Fabrication Technology"
          "Architecture"
          "Automobile"
          "Civil"
          "Commercial Practice"
          "Computer Science"
          "Electrical & Electronics"
          "Mechanical"
          "Mechatronics"
          "Mining"
    ],
    //  "ACHARYA PRE UNIVERSITY COLLEGE",
    collegeList[14]: [
      "PCMB"
          "PCMC"
          "CEBA"
    ],
    //  "ACHARYA INSTITUTE OF ENGLISH & FOREIGN LANGUAGE"
    collegeList[15]: [
      "Basic Certificate Programme"
          "Diploma Programme"
          "Advanced Certificate"
    ],
  };
}

List<String> aplCatagoryList = [
  "Choose your role",
  "Batsman",
  "Bowler",
  "All-Rounder"
];
/*
List<String> departmentList = [

  "Choose your department",

  "Master of Business Administration",
  "Master of Computer Application",


  "Post Graduate Diploma in Management",
  "Diploma in Elementary Education",
  "Diploma in Elementary Education",

  "Master Of Arts in Journalism and Mass Communication",
  "Master Of Social Work",
  "Diploma in General Nursing and MidWife",
  "Basic BSc Nursing",
  "Post Basic BSc Nursing",
  "Msc Nursing",
  "Painting",
  "Graphics Design",
  "Animation and Multimedia Design",
  "Interior and Spatial Design",
  "Product Design",
  "BSc in Anesthesia Technology",
  "B.Sc Operation Theater Technology",
  "BSc in Respiratory Care Technology",
  "BSc in Renal Dialysis Technology",
  "BSc in Radio Therapy",
  "BSc in Optometry",
  "BSc in Imaging Technology",
  "BSc in Medical Lab Technology",
  "Bachelor in Hospital Administration",
  "Bachelor in Public Health",
  "Bachelor of Physiotherapy",
  "Diploma in Aeronautical Engineering",
  "Diploma in Apparel Designing and Fabrication Technology",
  "Diploma in Architecture",
  "Diploma in Architecture",
  "Diploma in Automobile Engineering",
  "Diploma in Civil Engineering",
  "Diploma in Commercial Practice",
  "Diploma in Computer Science and Engineering",
  "Diploma in Electrical and Electronics Engineering",
  "Diploma in Electronics and Communication Engineering",
  "Diploma in Mechanical Engineering",
  "Diploma in Mechatronics Engineering",
  "Diploma in Mining Engineering",
  "PCMB",
  "PCMC",
  "CEBA",
  "Basic Certificate Programme",
  "Diploma Programme",
  "Advance Certificate",
];*/

List<String> departmentList = [
  "Choose your department",
  "Aeronautical Engineering",
  "Automobile Engineering",
  "Bio Technology Engineering",
  "Civil Engineering",
  "Computer Science and Engineering ",
  "Electrical and Electronics Engineering",
  "Electronics and Communication Engineering",
  "Information Science and Engineering",
  "Mechanical Engineering",
  "Mechatronics Engineering",
  "Mining Engineering",
  "Master of Business Administration",
  "Master of Computer Application",
  "M.Tech in Computer Science and Engineering",
  "M.Tech in Digital Communication and Engineering",
  "M.Tech in Bio Technology",
  "M.Tech in Machine Design",
  "Pharm D Doctor of Pharmacy",
  "Pharm D Post Baccalaureate PharmD",
  "M Pharm Industrial Pharmacy",
  "M Pharm Pharmacology",
  "M Pharm Pharmaceutics",
  "M Pharm Pharmaceutical Chemistry",
  "M Pharm Quality Assurance",
  "M Pharm Pharmaceutical Analysis",
  "M Pharm Pharmacognosy",
  "M Pharm Drug Regulatory Affairs",
  "D Pharm Diploma in Pharmacy",
  "Post Graduate Diploma in Management",
  "Diploma in Elementary Education",
  "Diploma in Elementary Education",
  "BACHELOR OF ARCHITECTURE",
  "BA LLB",
  "BBA LLB",
  "LLB",
  "Bachelor Of Business Administration",
  "Bachelor Of Business Administration in Aviation",
  "Bachelor Of Computer Application",
  "Bachelor Of Commerce",
  "Bachelor Of Social Work",
  "Bachelor Of Arts",
  "Bachelor Of Science",
  "Master of Finance and Accounting",
  "Master Of Commerce",
  "Master Of Science in Physics",
  "Master Of Science in Chemistry",
  "Master Of Science in Mathematics",
  "Master Of Science in Psychology",
  "Master Of Arts in English",
  "Master Of Arts in Economics",
  "Master Of Arts in Journalism and Mass Communication",
  "Master Of Social Work",
  "Diploma in General Nursing and MidWife",
  "Basic BSc Nursing",
  "Post Basic BSc Nursing",
  "Msc Nursing",
  "Painting",
  "Graphics Design",
  "Animation and Multimedia Design",
  "Interior and Spatial Design",
  "Product Design",
  "BSc in Anesthesia Technology",
  "B.Sc Operation Theater Technology",
  "BSc in Respiratory Care Technology",
  "BSc in Renal Dialysis Technology",
  "BSc in Radio Therapy",
  "BSc in Optometry",
  "BSc in Imaging Technology",
  "BSc in Medical Lab Technology",
  "Bachelor in Hospital Administration",
  "Bachelor in Public Health",
  "Bachelor of Physiotherapy",
  "Diploma in Aeronautical Engineering",
  "Diploma in Apparel Designing and Fabrication Technology",
  "Diploma in Architecture",
  "Diploma in Architecture",
  "Diploma in Automobile Engineering",
  "Diploma in Civil Engineering",
  "Diploma in Commercial Practice",
  "Diploma in Computer Science and Engineering",
  "Diploma in Electrical and Electronics Engineering",
  "Diploma in Electronics and Communication Engineering",
  "Diploma in Mechanical Engineering",
  "Diploma in Mechatronics Engineering",
  "Diploma in Mining Engineering",
  "PCMB",
  "PCMC",
  "CEBA",
  "Basic Certificate Programme",
  "Diploma Programme",
  "Advance Certificate",
];
List<String> yearList = ["Choose your year", "1", "2", "3", "4", "5", "6"];
List<String> workList = [
  "Area of interest",
  "Art",
  "Content Writing",
  "Video Editing",
  "Creative Thinking",
  "Web Development",
  "App Development",
  "Graffiti",
  "Photography",
  "Videography",
  "Emcee",
  "Poster Making",
  "Photo Editing",
  "Digital Editing",
  "Digital Marketing",
  "Marketing and Sponsorship",
  "Logo Design",
  "Brouchure Design",
  "Poster Design",
  "Animation"
];

//String college, department, year, work;
