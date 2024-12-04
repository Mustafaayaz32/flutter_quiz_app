import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswersSummary extends StatelessWidget {
  const AnswersSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summary
            .map((item) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item['correct'] == true
                              ? const Color.fromARGB(239, 120, 190, 244)
                              : Colors.red),
                      child: Center(
                        child: Text(
                          item["question_index"].toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 82, 2, 144),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            item["question"].toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            item["user_answer"].toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: item['correct'] == true
                                    ? const Color.fromARGB(239, 68, 255, 0)
                                    : Colors.red,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            item["correct_answer"].toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: const Color.fromARGB(239, 120, 190, 244),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                ))
            .toList());
  }
}
