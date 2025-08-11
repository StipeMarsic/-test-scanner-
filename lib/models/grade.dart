enum GradeSystem {
  croatian,    // 1-5 Croatian system
  percentage,  // 0-100%
  points,      // 0-100 points
  custom,      // Custom grading
}

class Grade {
  final GradeSystem system;
  final String grade;
  final double score;
  final String description;
  final String color;

  Grade({
    required this.system,
    required this.grade,
    required this.score,
    required this.description,
    required this.color,
  });

  // Create grade from score
  static Grade fromScore(double score, GradeSystem system) {
    String grade;
    String description;
    String color;

    switch (system) {
      case GradeSystem.croatian:
        if (score >= 90) {
          grade = '5';
          description = 'Odličan';
          color = '#4CAF50'; // Green
        } else if (score >= 80) {
          grade = '4';
          description = 'Vrlo dobar';
          color = '#8BC34A'; // Light green
        } else if (score >= 70) {
          grade = '3';
          description = 'Dobar';
          color = '#FFC107'; // Yellow
        } else if (score >= 60) {
          grade = '2';
          description = 'Dovoljan';
          color = '#FF9800'; // Orange
        } else {
          grade = '1';
          description = 'Nedovoljan';
          color = '#F44336'; // Red
        }
        break;

      case GradeSystem.percentage:
        grade = '${score.toStringAsFixed(1)}%';
        if (score >= 90) {
          description = 'Izvrsno';
          color = '#4CAF50';
        } else if (score >= 80) {
          description = 'Vrlo dobro';
          color = '#8BC34A';
        } else if (score >= 70) {
          description = 'Dobro';
          color = '#FFC107';
        } else if (score >= 60) {
          description = 'Dovoljno';
          color = '#FF9800';
        } else {
          description = 'Nedovoljno';
          color = '#F44336';
        }
        break;

      case GradeSystem.points:
        grade = '${score.toStringAsFixed(0)} bodova';
        if (score >= 90) {
          description = 'Izvrsno';
          color = '#4CAF50';
        } else if (score >= 80) {
          description = 'Vrlo dobro';
          color = '#8BC34A';
        } else if (score >= 70) {
          description = 'Dobro';
          color = '#FFC107';
        } else if (score >= 60) {
          description = 'Dovoljno';
          color = '#FF9800';
        } else {
          description = 'Nedovoljno';
          color = '#F44336';
        }
        break;

      case GradeSystem.custom:
        grade = 'Custom';
        description = 'Prilagođeno';
        color = '#2196F3'; // Blue
        break;
    }

    return Grade(
      system: system,
      grade: grade,
      score: score,
      description: description,
      color: color,
    );
  }

  // Get full grade string
  String get fullGrade {
    switch (system) {
      case GradeSystem.croatian:
        return '$grade ($description)';
      case GradeSystem.percentage:
        return '$grade - $description';
      case GradeSystem.points:
        return '$grade - $description';
      case GradeSystem.custom:
        return '$grade - $description';
    }
  }

  // Check if grade is passing
  bool get isPassing {
    switch (system) {
      case GradeSystem.croatian:
        return score >= 60; // 2 or higher
      case GradeSystem.percentage:
        return score >= 60;
      case GradeSystem.points:
        return score >= 60;
      case GradeSystem.custom:
        return score >= 60; // Default threshold
    }
  }

  // Get feedback based on grade
  String get feedback {
    if (isPassing) {
      if (score >= 90) {
        return 'Odličan rad! Nastavite s tim uspjehom.';
      } else if (score >= 80) {
        return 'Vrlo dobar rezultat. Možete još bolje!';
      } else if (score >= 70) {
        return 'Dobar rezultat. Postoji prostor za poboljšanje.';
      } else {
        return 'Dovoljan rezultat. Potrebno je više vježbe.';
      }
    } else {
      return 'Nedovoljan rezultat. Potrebna je dodatna nastava.';
    }
  }

  // Get recommendations based on grade
  List<String> get recommendations {
    final List<String> recommendations = [];

    if (score >= 90) {
      recommendations.add('Nastavite s tim uspjehom');
      recommendations.add('Možete pokušati složenije zadatke');
    } else if (score >= 80) {
      recommendations.add('Fokusirajte se na područja s greškama');
      recommendations.add('Više vježbe za poboljšanje');
    } else if (score >= 70) {
      recommendations.add('Potrebna je dodatna vježba');
      recommendations.add('Ponovite gradivo koje nije jasno');
    } else if (score >= 60) {
      recommendations.add('Potrebna je individualna nastava');
      recommendations.add('Ponovite osnove gradiva');
    } else {
      recommendations.add('Obavezno dodatno usavršavanje');
      recommendations.add('Konsultirajte se s profesorom');
    }

    return recommendations;
  }

  // Convert to map for storage
  Map<String, dynamic> toMap() {
    return {
      'system': system.toString(),
      'grade': grade,
      'score': score,
      'description': description,
      'color': color,
    };
  }

  // Create from map
  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      system: GradeSystem.values.firstWhere(
        (e) => e.toString() == map['system'],
        orElse: () => GradeSystem.croatian,
      ),
      grade: map['grade'] ?? '',
      score: (map['score'] ?? 0.0).toDouble(),
      description: map['description'] ?? '',
      color: map['color'] ?? '#000000',
    );
  }
}
