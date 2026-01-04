import { Document, Page, Text, View, StyleSheet } from "@react-pdf/renderer";
import type { FC } from "react";
import type { Problem } from "@/api";
import { renderPDFMathExpressionAdvanced } from "@/utils/pdfMathRenderer";

// Define styles for PDF
const styles = StyleSheet.create({
  page: {
    padding: "1cm",
    fontFamily: "Times-Roman",
    fontSize: 12,
  },
  header: {
    textAlign: "center",
    marginBottom: 20,
  },
  title: {
    fontSize: 18,
    fontWeight: "bold",
    marginBottom: 10,
  },
  metadata: {
    flexDirection: "row",
    justifyContent: "space-between",
    fontSize: 10,
    marginBottom: 20,
    paddingBottom: 10,
    borderBottom: "1px solid black",
  },
  metadataItem: {
    flexDirection: "row",
  },
  metadataLabel: {
    fontWeight: "bold",
    marginRight: 5,
  },
  problemsGrid: {
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "space-between",
  },
  problemColumn: {
    width: "48%",
  },
  problem: {
    marginBottom: 16,
    flexDirection: "row",
  },
  problemNumber: {
    fontWeight: "bold",
    marginRight: 8,
    minWidth: 25,
  },
  problemText: {
    flex: 1,
    flexDirection: "row",
    alignItems: "center",
    gap: 4,
  },
  fraction: {
    flexDirection: "column",
    alignItems: "center",
    marginHorizontal: 2,
  },
  fractionNumerator: {
    fontSize: 10,
    textAlign: "center",
    borderBottom: "1px solid black",
    paddingBottom: 1,
    paddingHorizontal: 3,
  },
  fractionDenominator: {
    fontSize: 10,
    textAlign: "center",
    paddingTop: 1,
    paddingHorizontal: 3,
  },
  answerKeyTitle: {
    fontSize: 14,
    fontWeight: "bold",
    textAlign: "center",
    marginBottom: 20,
    marginTop: 20,
  },
  answerGrid: {
    flexDirection: "row",
    flexWrap: "wrap",
  },
  answerColumn: {
    width: "48%",
  },
  answer: {
    marginBottom: 8,
    flexDirection: "row",
    fontSize: 9,
  },
  answerNumber: {
    fontWeight: "bold",
    marginRight: 5,
    minWidth: 20,
  },
});

interface PrintableWorksheetProps {
  title: string;
  problems: Problem[];
  studentName?: string;
  date?: string;
}

/**
 * Printable worksheet component using @react-pdf/renderer
 * Generates a 2-page PDF: Page 1 (problems), Page 2 (answer key)
 */
export const PrintableWorksheet: FC<PrintableWorksheetProps> = ({
  title,
  problems,
  studentName = "_____________________________",
  date = "_______________",
}) => {
  // Split problems into two columns for better layout
  const half = Math.ceil(problems.length / 2);
  const leftColumnProblems = problems.slice(0, half);
  const rightColumnProblems = problems.slice(half);

  return (
    <Document>
      {/* Page 1: Problems Only */}
      <Page size="A4" style={styles.page}>
        {/* Header */}
        <View style={styles.header}>
          <Text style={styles.title}>{title}</Text>
          <View style={styles.metadata}>
            <View style={styles.metadataItem}>
              <Text style={styles.metadataLabel}>Name:</Text>
              <Text>{studentName}</Text>
            </View>
            <View style={styles.metadataItem}>
              <Text style={styles.metadataLabel}>Date:</Text>
              <Text>{date}</Text>
            </View>
            <View style={styles.metadataItem}>
              <Text style={styles.metadataLabel}>Problems:</Text>
              <Text>{problems.length}</Text>
            </View>
          </View>
        </View>

        {/* Problems in two columns */}
        <View style={styles.problemsGrid}>
          {/* Left Column */}
          <View style={styles.problemColumn}>
            {leftColumnProblems.map((problem, idx) => (
              <View key={problem.id} style={styles.problem}>
                <Text style={styles.problemNumber}>{idx + 1}.</Text>
                <View style={styles.problemText}>
                  {renderPDFMathExpressionAdvanced(problem.question)}
                  <Text> =</Text>
                </View>
              </View>
            ))}
          </View>

          {/* Right Column */}
          <View style={styles.problemColumn}>
            {rightColumnProblems.map((problem, idx) => (
              <View key={problem.id} style={styles.problem}>
                <Text style={styles.problemNumber}>{half + idx + 1}.</Text>
                <View style={styles.problemText}>
                  {renderPDFMathExpressionAdvanced(problem.question)}
                  <Text> =</Text>
                </View>
              </View>
            ))}
          </View>
        </View>
      </Page>

      {/* Page 2: Answer Key */}
      <Page size="A4" style={styles.page}>
        <Text style={styles.answerKeyTitle}>Answer Key</Text>

        {/* Answers in two columns */}
        <View style={styles.answerGrid}>
          {/* Left Column */}
          <View style={styles.answerColumn}>
            {leftColumnProblems.map((problem, idx) => (
              <View key={`answer-${problem.id}`} style={styles.answer}>
                <Text style={styles.answerNumber}>{idx + 1}.</Text>
                <View style={styles.problemText}>
                  {renderPDFMathExpressionAdvanced(problem.question)}
                  <Text> = </Text>
                  {renderPDFMathExpressionAdvanced(problem.answer)}
                </View>
              </View>
            ))}
          </View>

          {/* Right Column */}
          <View style={styles.answerColumn}>
            {rightColumnProblems.map((problem, idx) => (
              <View key={`answer-${problem.id}`} style={styles.answer}>
                <Text style={styles.answerNumber}>{half + idx + 1}.</Text>
                <View style={styles.problemText}>
                  {renderPDFMathExpressionAdvanced(problem.question)}
                  <Text> = </Text>
                  {renderPDFMathExpressionAdvanced(problem.answer)}
                </View>
              </View>
            ))}
          </View>
        </View>
      </Page>
    </Document>
  );
};
