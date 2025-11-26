🚗 car_rent – Flutter Car Rental App

تطبيق تأجير سيارات متكامل مبني باستخدام Flutter مع واجهات احترافية، نظام مفضلة، شاشات تفاصيل السيارات، وحجز السيارات، مع ربط كامل بواجهة API مبنية بلغة C# ASP.NET Core.

يهدف التطبيق إلى توفير تجربة سهلة وسلسة للمستخدم لتصفح السيارات، عرض التفاصيل، بالإضافة إلى إدارة الحجوزات والمفضلة بطريقة حديثة وعملية.

📸 Screenshots
<p> <img width="260" src="https://github.com/user-attachments/assets/0ea7fe04-55d0-459d-87f8-3a36f8371b73" /> <img width="260" src="https://github.com/user-attachments/assets/d0b6980b-5010-4b59-aff6-80ba5fbfb757" /> <img width="260" src="https://github.com/user-attachments/assets/160145d9-f86d-46d8-b573-623597bc6a12" /> </p> <p> <img width="260" src="https://github.com/user-attachments/assets/66cbca8c-69f7-4069-acb6-190edc48647b" /> <img width="260" src="https://github.com/user-attachments/assets/592690e6-13f9-4267-9036-556f7c5d8504" /> <img width="260" src="https://github.com/user-attachments/assets/6625b444-11b6-4c11-b76e-0a415e7cfe51" /> </p>
✨ Features
🏠 الصفحة الرئيسية

عرض جميع السيارات

عرض السيارات الأكثر مبيعًا

عرض الفئات (Categories)

❤️ المفضلة

إضافة وإزالة السيارات من المفضلة

مزامنة بيانات المفضلة مع API في الخلفية

🚘 تفاصيل السيارة

أكثر من صورة لكل سيارة (Image Slider)

عرض المواصفات والخصائص

زر إضافة إلى المفضلة

زر الحجز السريع

📅 الحجز

إنشاء حجز جديد

إرسال البيانات إلى API

التحقق من صلاحية البيانات

🔐 تسجيل الدخول

تسجيل الدخول بواسطة API

حفظ بيانات المستخدم

التعامل مع التوكن

🧱 بنية قوية

إدارة الحالة باستخدام BLoC/Cubit

استخدام Model – Repository – Data Source

فصل الأكواد بطريقة Clean Architecture

🧱 Architecture Overview
lib/
 ├── controller/
 │    ├── fave/
 │    ├── home/
 │    ├── booking/
 │    └── auth/
 ├── data/
 │    ├── data_source/
 │    ├── repository/
 │    └── model/
 ├── view/
 │    ├── screens/
 │    └── widget/
 └── core/
      ├── constants/
      ├── class/
      └── functions/

🛠️ Tech Stack
الجزء	التكنولوجيا
واجهات	Flutter + Dart
إدارة الحالة	Bloc / Cubit
Backend	ASP.NET Core Web API
قاعدة البيانات	SQL Server
الصور	CachedNetworkImage
التخزين	SharedPreferences
التصميم	Flutter ScreenUtil + Material You
▶️ How to Run
git clone https://github.com/your-username/car_rent.git
cd car_rent
flutter pub get
flutter run

🔗 API Endpoints (مختصر)
العملية	Endpoint
تسجيل الدخول	/api/auth/login
جميع السيارات	/api/cars/getall?userId=
المفضلة	/api/favorite/add, /api/favorite/remove
الحجز	/api/booking/add


🤝 Contributing

مرحب بأي مساهمة لتحسين الأكواد، إضافة مميزات جديدة، إصلاح أخطاء، أو تحسين واجهات المستخدم.

📄 License

MIT License.
