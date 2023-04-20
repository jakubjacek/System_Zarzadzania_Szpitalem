package jj.systemszpitalny.constants;

public final class DatabaseConstants {

    public enum MedicineType {
        LIQUID("Plyny"),
        TABLET("Tabletki"),
        CAPSULES("Kapsulki"),
        DROPS("Krople"),
        INHALERS("Inhalatory"),
        INJECTIONS("Zastrzyki");

        private String type;

        private MedicineType(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

        public boolean equals(String type) {
            return this.type.equals(type.toUpperCase());
        }
    }

    public enum DoctorSpecialist {

        IMMUNOLOGISTS("Immunolog"),
        ANESTHESIOLOGISTS("Anestezjog"),
        CARDIOLOGISTS("Kardiolog"),
        DERMATOLOGISTS("Dermatolog"),
        ENDOCRINNOLOGISTS("Endokrynolog"),
        GASTROENTEROLOGISTS("Gastroenterolog"),
        HEMATOLOGISTS("Hematolog");

        private String type;

        private DoctorSpecialist(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

        public boolean equals(String type) {
            return this.type.equals(type.toUpperCase());
        }
    }

    public enum BloodGroup {
        A_POSITIVE("A+"),
        A_NEGATIVE("A-"),
        B_POSITIVE("B+"),
        B_NEGATIVE("B-"),
        O_POSITIVE("O+"),
        O_NEGATIVE("O-"),
        AB_POSITIVE("AB+"),
        AB_NEGATIVE("AB-");

        private String type;

        private BloodGroup(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

        public boolean equals(String type) {
            return this.type.equals(type.toUpperCase());
        }
    }

    public enum TreatmentStatus {
        DONE("Zakończone"),
        PENDING("W trakcie");

        private String type;

        private TreatmentStatus(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

    }

    public enum AppointmentTiming {
        NINE_TO_TEN_AM("09:00 - 10:00"),
        TEN_TO_ELEVEN_AM("10:00 - 11:00"),
        ELEVEN_TO_TWELVE_AM("11:00 - 12:00"),
        TWELVE_TO_ONE_PM("12:00 - 13:00"),
        ONE_TO_TWO_PM("13:00 - 14:00"),
        TWO_TO_THREE_PM("14:00 - 15:00"),
        THREE_TO_FOUR_PM("15:00 - 16:00"),
        FOUR_TO_FIVE_PM("16:00 - 17:00"),
        FIVE_TO_SIX_PM("17:00 - 18:00");

        private String time;

        private AppointmentTiming(String time) {
            this.time = time;
        }

        public String value() {
            return this.time;
        }

    }

    public enum WantMedicinesFromHospital {
        YES("Tak"),
        NO("Nie");

        private String type;

        private WantMedicinesFromHospital(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

    }

    public enum BillMade {
        YES("Tak"),
        NO("Nie");

        private String type;

        private BillMade(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

    }

    public enum AdminView {
        DASHBOARD("dashboard"),
        APPOINTMENT("appointment"),
        MEDICINE("medicine"),
        DOCTOR("doctor"),
        RECEPTIONIST("receptionist"),
        PHARMACIST("pharmacist"),
        PATIENT("patient"),
        EARNING("earning");

        private String type;

        private AdminView(String type) {
            this.type = type;
        }

        public String value() {
            return this.type;
        }

    }



}
