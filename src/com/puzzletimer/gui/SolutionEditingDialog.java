package com.puzzletimer.gui;

import com.puzzletimer.models.Solution;
import com.puzzletimer.models.Timing;
import com.puzzletimer.util.SolutionUtils;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.text.DateFormat;
import java.util.Date;

import static com.puzzletimer.Internationalization.i18n;

@SuppressWarnings("serial")
public class SolutionEditingDialog extends JDialog {
    public static class SolutionEditingDialogListener {
        public void solutionEdited(Solution solution) {
        }
    }

    private JTextField textFieldStart;
    private JTextField textFieldTime;
    private JComboBox<String> comboBoxPenalty;
    private JTextField textFieldScramble;
    private JButton buttonOk;
    private JButton buttonCancel;

    public SolutionEditingDialog(
            JFrame owner,
            boolean modal,
            final Solution solution,
            final SolutionEditingDialogListener listener) {
        super(owner, modal);

        setTitle(i18n("solution_editing.solution_editor"));
        setMinimumSize(new Dimension(480, 200));

        createComponents();
        pack();

        // start
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM);
        this.textFieldStart.setText(dateFormat.format(solution.getTiming().getStart()));

        // time
        this.textFieldTime.setText(SolutionUtils.formatMinutes(solution.getTiming().getElapsedTime(), false));
        this.addWindowFocusListener(new WindowAdapter() {
            @Override
            public void windowGainedFocus(WindowEvent e) {
                // text selection
                SolutionEditingDialog.this.textFieldTime.setSelectionStart(0);
                SolutionEditingDialog.this.textFieldTime.setSelectionEnd(Integer.MAX_VALUE);

                // focus
                SolutionEditingDialog.this.textFieldTime.requestFocusInWindow();
            }
        });

        // penalty
        this.comboBoxPenalty.addItem("");
        this.comboBoxPenalty.addItem("+2");
        this.comboBoxPenalty.addItem("DNF");
        this.comboBoxPenalty.setSelectedItem(solution.getPenalty());

        // scramble
        this.textFieldScramble.setText(solution.getScramble().getRawSequence());
        this.textFieldScramble.setCaretPosition(0);

        // ok button
        this.buttonOk.addActionListener(event -> {
            // timing
            long time =
                    SolutionUtils.parseTime(
                            SolutionEditingDialog.this.textFieldTime.getText());
            Timing timing =
                    new Timing(
                            solution.getTiming().getStart(),
                            new Date(solution.getTiming().getStart().getTime() + time));

            // penalty
            String penalty =
                    (String) SolutionEditingDialog.this.comboBoxPenalty.getSelectedItem();

            listener.solutionEdited(
                    solution.setTiming(timing).setPenalty(penalty));

            SolutionEditingDialog.this.dispose();
        });
        this.getRootPane().setDefaultButton(this.buttonOk);

        // cancel button
        this.buttonCancel.addActionListener(event -> SolutionEditingDialog.this.dispose());

        // esc key closes window
        this.getRootPane().registerKeyboardAction(
                arg0 -> SolutionEditingDialog.this.dispose(),
                KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0),
                JComponent.WHEN_IN_FOCUSED_WINDOW);
    }

    private void createComponents() {
        setLayout(
                new MigLayout(
                        "fill, wrap",
                        "[pref!][fill]",
                        "[pref!]8[pref!]8[pref!]8[pref!]16[bottom]"));

        // labelStart
        add(new JLabel(i18n("solution_editing.start")));

        // textFieldStart
        this.textFieldStart = new JTextField();
        this.textFieldStart.setEditable(false);
        this.textFieldStart.setFocusable(false);
        add(this.textFieldStart);

        // labelTime
        add(new JLabel(i18n("solution_editing.time")));

        // textFieldTime
        this.textFieldTime = new JTextField();
        add(this.textFieldTime);

        // labelPenalty
        add(new JLabel(i18n("solution_editing.penalty")));

        // comboBoxPenalty
        this.comboBoxPenalty = new JComboBox<>();
        add(this.comboBoxPenalty);

        // labelScramble
        add(new JLabel(i18n("solution_editing.scramble")));

        // textFieldScramble
        this.textFieldScramble = new JTextField();
        this.textFieldScramble.setEditable(false);
        this.textFieldScramble.setFocusable(false);
        add(this.textFieldScramble);

        // buttonOk
        this.buttonOk = new JButton(i18n("solution_editing.ok"));
        add(this.buttonOk, "tag ok, span 2, split");

        // buttonCancel
        this.buttonCancel = new JButton(i18n("solution_editing.cancel"));
        add(this.buttonCancel, "tag cancel");
    }
}