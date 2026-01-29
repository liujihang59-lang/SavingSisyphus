import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart'; // 核心：开启毛玻璃

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize(); // 初始化窗口
  await Window.setEffect(effect: WindowEffect.acrylic, color: Color(0x22000000)); // 烟熏透视
  runApp(SisyphusApp());
}

class SisyphusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Verdana'),
      home: SisyphusHome(),
    );
  }
}

class SisyphusHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 必须透明才能看到毛玻璃
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            // 1. 顶部自定义标题栏 (Mac 风格按钮 + 标题)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildMacBtn(Colors.redAccent),
                    SizedBox(width: 8),
                    _buildMacBtn(Colors.orangeAccent),
                    SizedBox(width: 8),
                    _buildMacBtn(Colors.greenAccent),
                  ],
                ),
                Text("SAVING SISYPHUS", style: TextStyle(color: Color(0xFFC0B283), fontWeight: FontWeight.w200, letterSpacing: 2)),
              ],
            ),
            SizedBox(height: 50),
            
            // 2. 加缪名言区
            Center(
              child: Column(
                children: [
                  Text("“我们必须想象西西弗斯是快乐的。”", 
                    style: TextStyle(fontSize: 26, color: Color(0xFFC0B283), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  SizedBox(height: 8),
                  Text("—— 阿尔贝·加缪", style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
            SizedBox(height: 60),

            // 3. 中间功能区：彩色细线勾勒
            Row(
              children: [
                Expanded(child: _buildLiteraryCard("📂 DATA SOURCE", Color(0xFF4DB6AC), ["教案文件夹路径", "输出保存路径"])),
                SizedBox(width: 30),
                Expanded(child: _buildLiteraryCard("🔑 ACCESS KEY", Color(0xFFF06292), ["DeepSeek 访问密钥", "任务中止 / ABORT"])),
              ],
            ),
            SizedBox(height: 30),

            // 4. 底部日志区
            Expanded(child: _buildLiteraryCard("📜 SYSTEM LOG", Color(0xFF81C784), ["正在初始化教案处理引擎...", "> 磨砂透视模式已激活"])),
          ],
        ),
      ),
    );
  }

  // 构建 Mac 风格小圆点
  Widget _buildMacBtn(Color color) => Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle));

  // 构建彩色细线文艺卡片
  Widget _buildLiteraryCard(String title, Color accentColor, List<String> contents) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: accentColor.withOpacity(0.4), width: 1.5), // 彩色细线
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
          Divider(color: accentColor.withOpacity(0.1), height: 30),
          ...contents.map((text) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(text, style: TextStyle(color: Colors.white70, fontSize: 13)),
          )).toList(),
        ],
      ),
    );
  }
}
