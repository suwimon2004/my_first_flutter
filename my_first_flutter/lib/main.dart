import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import ไลบรารี Material ของ Flutter
//import 'package:google_fonts/google_fonts.dart';
 
void main() {
  // จุดเริ่มต้นของแอป Flutter
  runApp(const MyApp()); // บอก Flutter ว่าวิดเจ็ตใดคือรากฐานของแอป
}
 
// MyApp โดยทั่วไปคือวิดเจ็ตรากฐานของแอปพลิเคชันของคุณ
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor
 
  @override
  Widget build(BuildContext context) {
    // เมธอด build() ส่งคืนโครงสร้างต้นไม้วิดเจ็ตสำหรับวิดเจ็ตนี้
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 231, 73, 73),
        ),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue, // ปรับแต่งสี AppBar
      ),
      body: Padding(
        // เพิ่ม Padding รอบ Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ใช้ Column สำหรับเลย์เอาต์แนวตั้ง
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://cdn.pixabay.com/photo/2016/03/27/21/16/pet-1284307_1280.jpg',
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              'assets/images/dogMe.jpg',
              errorBuilder: (context, error, stackTrace) {
                // แนวปฏิบัติที่ดีแม้สำหรับ assets, เผื่อกรณีพาธผิด
                return const Text(
                  'เกิดข้อผิดพลาดในการโหลด asset',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "สวัสดี Flutter",
                style: GoogleFonts.lacquer(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดกึ่งกลางปุ่มแนวนอน
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 30,
              tooltip: 'ข้อมูล', // ข้อความช่วยเหลือ
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}