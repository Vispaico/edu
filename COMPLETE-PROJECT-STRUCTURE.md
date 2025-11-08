# Complete Next.js Educational Consultancy Platform - Production Ready

## 📁 Complete Project Structure

```
edu-consultancy-platform/
├── .env.local                    # Environment variables
├── .eslintrc.json               # ESLint configuration
├── .gitignore                   # Git ignore file
├── next.config.js               # Next.js configuration
├── package.json                 # Dependencies
├── postcss.config.js            # PostCSS configuration
├── tailwind.config.ts           # Tailwind CSS configuration
├── tsconfig.json                # TypeScript configuration
├── components.json              # shadcn/ui configuration
│
├── prisma/
│   ├── schema.prisma            # Database schema
│   └── seed.ts                  # Database seeding
│
├── public/
│   ├── images/
│   │   ├── logo.svg
│   │   ├── hero-bg.jpg
│   │   └── universities/        # University logos
│   └── uploads/                 # User uploaded files
│
├── src/
│   ├── app/                     # Next.js 14 App Router
│   │   ├── layout.tsx           # Root layout
│   │   ├── page.tsx             # Homepage
│   │   ├── globals.css          # Global styles
│   │   │
│   │   ├── (public)/            # Public pages group
│   │   │   ├── layout.tsx
│   │   │   ├── about/
│   │   │   │   └── page.tsx
│   │   │   ├── services/
│   │   │   │   └── page.tsx
│   │   │   ├── universities/
│   │   │   │   ├── page.tsx
│   │   │   │   └── [slug]/
│   │   │   │       └── page.tsx
│   │   │   ├── blog/
│   │   │   │   ├── page.tsx
│   │   │   │   └── [slug]/
│   │   │   │       └── page.tsx
│   │   │   ├── contact/
│   │   │   │   └── page.tsx
│   │   │   ├── privacy/
│   │   │   │   └── page.tsx
│   │   │   ├── terms/
│   │   │   │   └── page.tsx
│   │   │   └── faq/
│   │   │       └── page.tsx
│   │   │
│   │   ├── (auth)/              # Authentication pages
│   │   │   ├── login/
│   │   │   │   └── page.tsx
│   │   │   ├── register/
│   │   │   │   └── page.tsx
│   │   │   ├── forgot-password/
│   │   │   │   └── page.tsx
│   │   │   └── verify-email/
│   │   │       └── page.tsx
│   │   │
│   │   ├── (dashboard)/         # Protected dashboard pages
│   │   │   ├── layout.tsx
│   │   │   ├── student/
│   │   │   │   ├── dashboard/
│   │   │   │   │   └── page.tsx
│   │   │   │   ├── applications/
│   │   │   │   │   ├── page.tsx
│   │   │   │   │   ├── new/
│   │   │   │   │   │   └── page.tsx
│   │   │   │   │   └── [id]/
│   │   │   │   │       └── page.tsx
│   │   │   │   ├── universities/
│   │   │   │   │   └── page.tsx
│   │   │   │   ├── tests/
│   │   │   │   │   └── page.tsx
│   │   │   │   ├── documents/
│   │   │   │   │   └── page.tsx
│   │   │   │   ├── messages/
│   │   │   │   │   └── page.tsx
│   │   │   │   └── settings/
│   │   │   │       └── page.tsx
│   │   │   │
│   │   │   └── admin/
│   │   │       ├── dashboard/
│   │   │       │   └── page.tsx
│   │   │       ├── students/
│   │   │       │   ├── page.tsx
│   │   │       │   └── [id]/
│   │   │       │       └── page.tsx
│   │   │       ├── applications/
│   │   │       │   └── page.tsx
│   │   │       ├── universities/
│   │   │       │   ├── page.tsx
│   │   │       │   └── new/
│   │   │       │       └── page.tsx
│   │   │       ├── tests/
│   │   │       │   └── page.tsx
│   │   │       ├── payments/
│   │   │       │   └── page.tsx
│   │   │       ├── blog/
│   │   │       │   ├── page.tsx
│   │   │       │   └── new/
│   │   │       │       └── page.tsx
│   │   │       └── settings/
│   │   │           └── page.tsx
│   │   │
│   │   └── api/                 # API Routes
│   │       ├── auth/
│   │       │   ├── [...nextauth]/
│   │       │   │   └── route.ts
│   │       │   ├── register/
│   │       │   │   └── route.ts
│   │       │   └── verify/
│   │       │       └── route.ts
│   │       ├── applications/
│   │       │   ├── route.ts
│   │       │   └── [id]/
│   │       │       └── route.ts
│   │       ├── universities/
│   │       │   └── route.ts
│   │       ├── tests/
│   │       │   └── route.ts
│   │       ├── documents/
│   │       │   ├── upload/
│   │       │   │   └── route.ts
│   │       │   └── [id]/
│   │       │       └── route.ts
│   │       ├── payments/
│   │       │   ├── verify/
│   │       │   │   └── route.ts
│   │       │   └── vietqr/
│   │       │       └── route.ts
│   │       ├── messages/
│   │       │   └── route.ts
│   │       └── blog/
│   │           └── route.ts
│   │
│   ├── components/              # Reusable components
│   │   ├── ui/                  # shadcn/ui components
│   │   │   ├── button.tsx
│   │   │   ├── card.tsx
│   │   │   ├── dialog.tsx
│   │   │   ├── dropdown-menu.tsx
│   │   │   ├── form.tsx
│   │   │   ├── input.tsx
│   │   │   ├── select.tsx
│   │   │   ├── table.tsx
│   │   │   ├── tabs.tsx
│   │   │   └── ...more
│   │   │
│   │   ├── layout/
│   │   │   ├── header.tsx
│   │   │   ├── footer.tsx
│   │   │   ├── navbar.tsx
│   │   │   └── sidebar.tsx
│   │   │
│   │   ├── home/
│   │   │   ├── hero-section.tsx
│   │   │   ├── services-section.tsx
│   │   │   ├── universities-section.tsx
│   │   │   ├── testimonials-section.tsx
│   │   │   ├── stats-section.tsx
│   │   │   └── cta-section.tsx
│   │   │
│   │   ├── dashboard/
│   │   │   ├── student/
│   │   │   │   ├── visa-timeline.tsx
│   │   │   │   ├── application-card.tsx
│   │   │   │   ├── test-calendar.tsx
│   │   │   │   └── document-uploader.tsx
│   │   │   └── admin/
│   │   │       ├── student-table.tsx
│   │   │       ├── application-pipeline.tsx
│   │   │       └── analytics-cards.tsx
│   │   │
│   │   ├── forms/
│   │   │   ├── application-form.tsx
│   │   │   ├── contact-form.tsx
│   │   │   ├── login-form.tsx
│   │   │   └── register-form.tsx
│   │   │
│   │   └── shared/
│   │       ├── language-switcher.tsx
│   │       ├── loading-spinner.tsx
│   │       ├── error-boundary.tsx
│   │       └── seo-meta.tsx
│   │
│   ├── lib/                     # Utilities and configs
│   │   ├── auth.ts              # NextAuth configuration
│   │   ├── prisma.ts            # Prisma client
│   │   ├── email.ts             # Email service
│   │   ├── upload.ts            # File upload utilities
│   │   ├── payment.ts           # Payment integration
│   │   ├── utils.ts             # Helper functions
│   │   └── validations.ts       # Zod schemas
│   │
│   ├── hooks/                   # Custom React hooks
│   │   ├── use-user.ts
│   │   ├── use-applications.ts
│   │   └── use-toast.ts
│   │
│   ├── types/                   # TypeScript types
│   │   ├── index.ts
│   │   ├── models.ts
│   │   └── api.ts
│   │
│   ├── i18n/                    # Internationalization
│   │   ├── config.ts
│   │   ├── locales/
│   │   │   ├── en.json
│   │   │   └── vi.json
│   │   └── translations.ts
│   │
│   └── styles/                  # Additional styles
│       └── globals.css
│
└── docs/
    ├── API.md                   # API documentation
    ├── DEPLOYMENT.md            # Deployment guide
    └── DEVELOPMENT.md           # Development guide
```

## 📦 Complete Dependencies (package.json)

```json
{
  "name": "edu-consultancy-platform",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "db:generate": "prisma generate",
    "db:push": "prisma db push",
    "db:seed": "prisma db seed",
    "db:studio": "prisma studio"
  },
  "dependencies": {
    "next": "^14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "typescript": "^5.4.0",
    
    "@prisma/client": "^5.14.0",
    "next-auth": "^4.24.0",
    "bcryptjs": "^2.4.3",
    
    "@radix-ui/react-dialog": "^1.0.5",
    "@radix-ui/react-dropdown-menu": "^2.0.6",
    "@radix-ui/react-select": "^2.0.0",
    "@radix-ui/react-tabs": "^1.0.4",
    "@radix-ui/react-toast": "^1.1.5",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.1.1",
    "tailwind-merge": "^2.3.0",
    "tailwindcss-animate": "^1.0.7",
    
    "zod": "^3.23.0",
    "react-hook-form": "^7.51.0",
    "@hookform/resolvers": "^3.3.4",
    
    "nodemailer": "^6.9.13",
    "date-fns": "^3.6.0",
    "lucide-react": "^0.379.0",
    
    "next-intl": "^3.14.0",
    
    "sharp": "^0.33.4"
  },
  "devDependencies": {
    "@types/node": "^20.12.0",
    "@types/react": "^18.3.0",
    "@types/react-dom": "^18.3.0",
    "@types/bcryptjs": "^2.4.6",
    "@types/nodemailer": "^6.4.15",
    
    "prisma": "^5.14.0",
    "ts-node": "^10.9.2",
    
    "tailwindcss": "^3.4.0",
    "postcss": "^8.4.0",
    "autoprefixer": "^10.4.0",
    
    "eslint": "^8.57.0",
    "eslint-config-next": "^14.2.0"
  },
  "prisma": {
    "seed": "ts-node --compiler-options {\"module\":\"CommonJS\"} prisma/seed.ts"
  }
}
```

## 🗄️ Complete Database Schema (prisma/schema.prisma)

```prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "sqlite"  // Change to "postgresql" for production
  url      = env("DATABASE_URL")
}

// User Models
model User {
  id            String    @id @default(cuid())
  email         String    @unique
  password      String
  name          String
  phone         String?
  role          Role      @default(STUDENT)
  emailVerified DateTime?
  image         String?
  createdAt     DateTime  @default(now())
  updatedAt     DateTime  @updatedAt

  // Relations
  student       Student?
  consultant    Consultant?
  sessions      Session[]
  verificationTokens VerificationToken[]
}

enum Role {
  STUDENT
  CONSULTANT
  ADMIN
}

model Session {
  id           String   @id @default(cuid())
  sessionToken String   @unique
  userId       String
  expires      DateTime
  user         User     @relation(fields: [userId], references: [id], onDelete: Cascade)
}

model VerificationToken {
  id         String   @id @default(cuid())
  identifier String
  token      String   @unique
  expires    DateTime
  userId     String
  user       User     @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([identifier, token])
}

// Student Profile
model Student {
  id               String   @id @default(cuid())
  userId           String   @unique
  user             User     @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  // Personal Information
  firstName        String
  lastName         String
  dateOfBirth      DateTime
  nationality      String   @default("Vietnam")
  passportNumber   String?
  gender           String?
  address          String?
  city             String?
  
  // Academic Information
  education        String?
  major            String?
  gpa              Float?
  
  // English Test Scores
  ieltsScore       Float?
  toeflScore       Int?
  pteScore         Int?
  
  createdAt        DateTime @default(now())
  updatedAt        DateTime @updatedAt

  // Relations
  applications     Application[]
  documents        Document[]
  testBookings     TestBooking[]
  messages         Message[]
  payments         Payment[]
}

// Consultant Profile
model Consultant {
  id          String   @id @default(cuid())
  userId      String   @unique
  user        User     @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  specialization String?
  experience     Int?     // Years of experience
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  // Relations
  applications Application[]
  messages     Message[]
}

// University
model University {
  id              String   @id @default(cuid())
  name            String
  nameVi          String?
  slug            String   @unique
  city            String
  state           String
  country         String   @default("Australia")
  
  logo            String?
  website         String?
  ranking         Int?
  
  description     String?
  descriptionVi   String?
  
  tuitionMin      Int?     // AUD per year
  tuitionMax      Int?
  
  requirements    String?  // JSON string for requirements
  
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt

  // Relations
  courses         Course[]
  applications    Application[]
}

// Course/Program
model Course {
  id            String   @id @default(cuid())
  universityId  String
  university    University @relation(fields: [universityId], references: [id], onDelete: Cascade)
  
  name          String
  nameVi        String?
  degree        String   // Bachelor, Master, PhD
  duration      Int      // Months
  tuition       Int      // AUD per year
  
  description   String?
  requirements  String?  // JSON string
  
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt

  // Relations
  applications  Application[]
}

// Application
model Application {
  id              String   @id @default(cuid())
  studentId       String
  student         Student  @relation(fields: [studentId], references: [id], onDelete: Cascade)
  
  universityId    String
  university      University @relation(fields: [universityId], references: [id])
  
  courseId        String?
  course          Course?  @relation(fields: [courseId], references: [id])
  
  consultantId    String?
  consultant      Consultant? @relation(fields: [consultantId], references: [id])
  
  // Application Details
  status          ApplicationStatus @default(DRAFT)
  intake          String   // e.g., "February 2025"
  visaStatus      VisaStatus @default(NOT_STARTED)
  
  // Tracking
  submittedAt     DateTime?
  offerReceivedAt DateTime?
  visaAppliedAt   DateTime?
  visaApprovedAt  DateTime?
  
  notes           String?
  
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt

  // Relations
  documents       Document[]
  payments        Payment[]
}

enum ApplicationStatus {
  DRAFT
  SUBMITTED
  UNDER_REVIEW
  OFFER_RECEIVED
  OFFER_ACCEPTED
  VISA_PROCESSING
  APPROVED
  REJECTED
  WITHDRAWN
}

enum VisaStatus {
  NOT_STARTED
  DOCUMENTS_PREPARATION
  SUBMITTED
  BIOMETRICS_DONE
  MEDICAL_DONE
  PROCESSING
  APPROVED
  REJECTED
}

// Document
model Document {
  id              String   @id @default(cuid())
  studentId       String
  student         Student  @relation(fields: [studentId], references: [id], onDelete: Cascade)
  
  applicationId   String?
  application     Application? @relation(fields: [applicationId], references: [id])
  
  type            DocumentType
  name            String
  fileName        String
  fileUrl         String
  fileSize        Int      // Bytes
  
  status          DocumentStatus @default(PENDING)
  verifiedAt      DateTime?
  verifiedBy      String?
  
  notes           String?
  
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt
}

enum DocumentType {
  PASSPORT
  TRANSCRIPT
  DIPLOMA
  IELTS_CERTIFICATE
  TOEFL_CERTIFICATE
  PTE_CERTIFICATE
  RECOMMENDATION_LETTER
  PERSONAL_STATEMENT
  CV
  FINANCIAL_PROOF
  BIRTH_CERTIFICATE
  VISA_APPLICATION
  MEDICAL_CERTIFICATE
  POLICE_CHECK
  OTHER
}

enum DocumentStatus {
  PENDING
  VERIFIED
  REJECTED
  EXPIRED
}

// Language Test Booking
model TestBooking {
  id          String   @id @default(cuid())
  studentId   String
  student     Student  @relation(fields: [studentId], references: [id], onDelete: Cascade)
  
  testType    TestType
  testCenter  String
  location    String
  testDate    DateTime
  
  registrationId String?
  status      BookingStatus @default(PENDING)
  
  score       Float?
  resultDate  DateTime?
  
  notes       String?
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}

enum TestType {
  IELTS_ACADEMIC
  IELTS_GENERAL
  TOEFL_IBT
  PTE_ACADEMIC
}

enum BookingStatus {
  PENDING
  CONFIRMED
  COMPLETED
  CANCELLED
  NO_SHOW
}

// Payment
model Payment {
  id              String   @id @default(cuid())
  studentId       String
  student         Student  @relation(fields: [studentId], references: [id], onDelete: Cascade)
  
  applicationId   String?
  application     Application? @relation(fields: [applicationId], references: [id])
  
  amount          Int      // VND
  type            PaymentType
  method          PaymentMethod
  
  status          PaymentStatus @default(PENDING)
  
  // Bank Transfer Details
  bankName        String?
  accountNumber   String?
  transferCode    String?
  transferDate    DateTime?
  
  // Receipt
  receiptUrl      String?
  
  verifiedAt      DateTime?
  verifiedBy      String?
  
  notes           String?
  
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt
}

enum PaymentType {
  CONSULTATION_FEE
  APPLICATION_FEE
  VISA_SUPPORT_FEE
  DOCUMENT_TRANSLATION
  TEST_REGISTRATION
  OTHER
}

enum PaymentMethod {
  BANK_TRANSFER
  VIETQR
  MOMO
  ZALOPAY
  CASH
}

enum PaymentStatus {
  PENDING
  VERIFIED
  COMPLETED
  REJECTED
  REFUNDED
}

// Message/Chat
model Message {
  id          String   @id @default(cuid())
  studentId   String
  student     Student  @relation(fields: [studentId], references: [id], onDelete: Cascade)
  
  consultantId String?
  consultant   Consultant? @relation(fields: [consultantId], references: [id])
  
  content     String
  isFromStudent Boolean @default(true)
  
  readAt      DateTime?
  
  createdAt   DateTime @default(now())
}

// Blog Post
model BlogPost {
  id          String   @id @default(cuid())
  slug        String   @unique
  
  title       String
  titleVi     String?
  
  excerpt     String?
  excerptVi   String?
  
  content     String
  contentVi   String?
  
  coverImage  String?
  
  category    String?
  tags        String?  // JSON array
  
  published   Boolean  @default(false)
  publishedAt DateTime?
  
  views       Int      @default(0)
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}
```

## 🚀 Installation & Setup Commands

```bash
# 1. Create project directory
mkdir edu-consultancy-platform
cd edu-consultancy-platform

# 2. Initialize Next.js project
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir --import-alias "@/*"

# 3. Install all dependencies
npm install @prisma/client next-auth bcryptjs @radix-ui/react-dialog @radix-ui/react-dropdown-menu @radix-ui/react-select @radix-ui/react-tabs @radix-ui/react-toast class-variance-authority clsx tailwind-merge tailwindcss-animate zod react-hook-form @hookform/resolvers nodemailer date-fns lucide-react next-intl sharp

# 4. Install dev dependencies
npm install -D prisma @types/bcryptjs @types/nodemailer ts-node

# 5. Initialize Prisma
npx prisma init --datasource-provider sqlite

# 6. Initialize shadcn/ui
npx shadcn-ui@latest init

# When prompted:
# - Would you like to use TypeScript? Yes
# - Which style would you like to use? Default
# - Which color would you like to use as base color? Slate
# - Where is your global CSS file? src/app/globals.css
# - Would you like to use CSS variables for colors? Yes
# - Are you using a custom tailwind prefix? No
# - Where is your tailwind.config.js located? tailwind.config.ts
# - Configure the import alias for components? @/components
# - Configure the import alias for utils? @/lib/utils

# 7. Add shadcn/ui components
npx shadcn-ui@latest add button card dialog dropdown-menu form input label select table tabs toast

# 8. Create .env.local file
cat > .env.local << 'EOF'
# Database
DATABASE_URL="file:./dev.db"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="generate-with-openssl-rand-base64-32"

# Email (Gmail example)
SMTP_HOST="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USER="your-email@gmail.com"
SMTP_PASSWORD="your-app-password"
EMAIL_FROM="noreply@yourdomain.com"

# Upload
UPLOAD_DIR="./public/uploads"
MAX_FILE_SIZE="10485760"

# App
NEXT_PUBLIC_APP_URL="http://localhost:3000"
NEXT_PUBLIC_APP_NAME="Edu Consultancy"
EOF

# 9. Generate NEXTAUTH_SECRET
openssl rand -base64 32

# Copy the output and replace "generate-with-openssl-rand-base64-32" in .env.local

# 10. Setup database
npx prisma generate
npx prisma db push
npx prisma db seed

# 11. Run development server
npm run dev
```

## 📝 Next Steps

After running the setup, you'll need to create the actual component files. I'll provide those in separate files:

1. **Core Configuration Files** (next.config.js, tailwind.config.ts, etc.)
2. **Layout Components** (Header, Footer, Navbar, Sidebar)
3. **Homepage Components** (Hero, Services, Testimonials, etc.)
4. **Dashboard Components** (Student & Admin)
5. **Form Components** (Login, Register, Application)
6. **API Routes** (Authentication, Applications, Uploads)
7. **Utility Functions** (Auth, Prisma, Email, Validation)

Would you like me to generate these files next? I can create them one by one or provide a complete zip-ready structure.
