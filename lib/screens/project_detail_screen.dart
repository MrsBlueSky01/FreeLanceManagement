import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/api_services.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final ApiService _apiService = ApiService();

  // Kutucuklardaki yazıları kontrol etmek için
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late String _selectedStatus;

  // Hata almamak için durum listesini tanımlıyoruz
  final List<String> _statusOptions = [
    "Devam Ediyor",
    "Tamamlandı",
    "İptal Edildi",
  ];

  @override
  void initState() {
    super.initState();
    // Sayfa açıldığında mevcut bilgileri kutucuklara doldur
    _nameController = TextEditingController(text: widget.project.name);
    _descController = TextEditingController(text: widget.project.description);

    // Eğer veritabanından gelen durum listede yoksa hata vermemesi için ilk değeri seç
    if (_statusOptions.contains(widget.project.status)) {
      _selectedStatus = widget.project.status;
    } else {
      _selectedStatus = _statusOptions[0];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projeyi Düzenle"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proje Bilgileri",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // İsim Kutusu
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Proje Adı",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 20),

            // Açıklama Kutusu
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Açıklama",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 20),

            // Durum Seçici (Dropdown)
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: const InputDecoration(
                labelText: "Durum",
                border: OutlineInputBorder(),
              ),
              items: _statusOptions
                  .map(
                    (status) =>
                        DropdownMenuItem(value: status, child: Text(status)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
            const SizedBox(height: 30),

            // GÜNCELLE BUTONU
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  // Mevcut id'yi koruyarak yeni verilerle güncel bir nesne oluşturuyoruz
                  final updatedProject = Project(
                    id: widget.project.id,
                    name: _nameController.text,
                    description: _descController.text,
                    status: _selectedStatus,
                  );

                  // API'ye gönder (id mutlaka olmalı)
                  bool basarili = await _apiService.updateProject(
                    widget.project.id ?? "",
                    updatedProject,
                  );

                  if (basarili) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Proje başarıyla güncellendi!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(
                        context,
                        true,
                      ); // Önceki sayfaya dön ve listeyi yenile
                    }
                  } else {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Hata: Güncelleme yapılamadı."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "DEĞİŞİKLİKLERİ KAYDET",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
