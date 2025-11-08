#!/bin/bash

# Educational Consultancy Platform - Quick Start Generator
# This script creates all essential files for the Next.js project

echo "🚀 Creating Educational Consultancy Platform Files..."
echo "=================================================="
echo ""

PROJECT_DIR="edu-consultancy-platform"

# Create src directory structure
mkdir -p src/app
mkdir -p src/components/{ui,layout,home,dashboard,forms,shared}
mkdir -p src/lib
mkdir -p src/hooks
mkdir -p src/types
mkdir -p src/i18n/locales
mkdir -p public/images/universities
mkdir -p public/uploads

echo "✅ Directory structure created"
echo ""

# Create homepage (src/app/page.tsx)
cat > src/app/page.tsx << 'EOF'
import Link from 'next/link'
import { Button } from '@/components/ui/button'

export default function HomePage() {
  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <section className="relative bg-gradient-to-b from-blue-50 to-white py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto text-center">
            <h1 className="text-5xl font-bold text-gray-900 mb-6">
              Your Journey to Study in Australia Starts Here
            </h1>
            <p className="text-xl text-gray-600 mb-8">
              Professional education consultancy helping Vietnamese students achieve their dreams
              of studying at top Australian universities.
            </p>
            <div className="flex gap-4 justify-center">
              <Button size="lg" asChild>
                <Link href="/register">Get Started Free</Link>
              </Button>
              <Button size="lg" variant="outline" asChild>
                <Link href="/universities">Browse Universities</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">500+</div>
              <div className="text-gray-600">Students Placed</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">50+</div>
              <div className="text-gray-600">Partner Universities</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">95%</div>
              <div className="text-gray-600">Visa Success Rate</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">10+</div>
              <div className="text-gray-600">Years Experience</div>
            </div>
          </div>
        </div>
      </section>

      {/* Services Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Our Services</h2>
            <p className="text-gray-600">Comprehensive support for your study abroad journey</p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {services.map((service, index) => (
              <div key={index} className="bg-white p-6 rounded-lg shadow-sm">
                <div className="text-blue-600 mb-4">{service.icon}</div>
                <h3 className="text-xl font-semibold mb-2">{service.title}</h3>
                <p className="text-gray-600">{service.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-blue-600">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold text-white mb-4">
            Ready to Start Your Journey?
          </h2>
          <p className="text-blue-100 mb-8 max-w-2xl mx-auto">
            Join hundreds of Vietnamese students who have successfully enrolled in top
            Australian universities with our help.
          </p>
          <Button size="lg" variant="secondary" asChild>
            <Link href="/register">Create Free Account</Link>
          </Button>
        </div>
      </section>
    </main>
  )
}

const services = [
  {
    icon: '🎓',
    title: 'University Selection',
    description: 'Expert guidance to choose the right university and program for your goals'
  },
  {
    icon: '📝',
    title: 'Application Support',
    description: 'Complete assistance with university applications and documentation'
  },
  {
    icon: '✈️',
    title: 'Visa Processing',
    description: 'Step-by-step support for Australian student visa (Subclass 500)'
  },
  {
    icon: '📚',
    title: 'Test Preparation',
    description: 'IELTS, TOEFL, and PTE test booking and preparation resources'
  },
  {
    icon: '💼',
    title: 'Career Counseling',
    description: 'Professional advice on career paths and job prospects in Australia'
  },
  {
    icon: '🏠',
    title: 'Pre-Departure',
    description: 'Accommodation, travel, and settlement support for your move to Australia'
  }
]
EOF

echo "✅ Homepage created (src/app/page.tsx)"

# Create root layout
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { Header } from '@/components/layout/header'
import { Footer } from '@/components/layout/footer'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Edu Consultancy - Study in Australia',
  description: 'Professional education consultancy helping Vietnamese students study in Australia',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Header />
        {children}
        <Footer />
      </body>
    </html>
  )
}
EOF

echo "✅ Root layout created (src/app/layout.tsx)"

# Create Header component
cat > src/components/layout/header.tsx << 'EOF'
import Link from 'next/link'
import { Button } from '@/components/ui/button'

export function Header() {
  return (
    <header className="border-b bg-white sticky top-0 z-50">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <Link href="/" className="flex items-center gap-2">
            <div className="w-8 h-8 bg-blue-600 rounded-lg" />
            <span className="font-bold text-xl">Edu Consultancy</span>
          </Link>
          
          <nav className="hidden md:flex items-center gap-6">
            <Link href="/universities" className="text-gray-600 hover:text-gray-900">
              Universities
            </Link>
            <Link href="/services" className="text-gray-600 hover:text-gray-900">
              Services
            </Link>
            <Link href="/blog" className="text-gray-600 hover:text-gray-900">
              Blog
            </Link>
            <Link href="/about" className="text-gray-600 hover:text-gray-900">
              About
            </Link>
            <Link href="/contact" className="text-gray-600 hover:text-gray-900">
              Contact
            </Link>
          </nav>

          <div className="flex items-center gap-4">
            <Button variant="ghost" asChild>
              <Link href="/login">Login</Link>
            </Button>
            <Button asChild>
              <Link href="/register">Sign Up</Link>
            </Button>
          </div>
        </div>
      </div>
    </header>
  )
}
EOF

echo "✅ Header component created"

# Create Footer component
cat > src/components/layout/footer.tsx << 'EOF'
import Link from 'next/link'

export function Footer() {
  return (
    <footer className="bg-gray-900 text-gray-300">
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h3 className="font-bold text-white mb-4">Edu Consultancy</h3>
            <p className="text-sm">
              Your trusted partner for studying in Australia.
              Professional guidance since 2014.
            </p>
          </div>
          
          <div>
            <h4 className="font-semibold text-white mb-4">Services</h4>
            <ul className="space-y-2 text-sm">
              <li><Link href="/services">University Selection</Link></li>
              <li><Link href="/services">Application Support</Link></li>
              <li><Link href="/services">Visa Processing</Link></li>
              <li><Link href="/services">Test Preparation</Link></li>
            </ul>
          </div>
          
          <div>
            <h4 className="font-semibold text-white mb-4">Resources</h4>
            <ul className="space-y-2 text-sm">
              <li><Link href="/universities">Universities</Link></li>
              <li><Link href="/blog">Blog</Link></li>
              <li><Link href="/faq">FAQ</Link></li>
              <li><Link href="/contact">Contact Us</Link></li>
            </ul>
          </div>
          
          <div>
            <h4 className="font-semibold text-white mb-4">Contact</h4>
            <ul className="space-y-2 text-sm">
              <li>📍 Hanoi, Vietnam</li>
              <li>📞 +84 123 456 789</li>
              <li>✉️ info@educonsultancy.vn</li>
            </ul>
          </div>
        </div>
        
        <div className="border-t border-gray-800 mt-8 pt-8 text-sm text-center">
          <p>&copy; 2025 Edu Consultancy. All rights reserved.</p>
          <div className="mt-2 space-x-4">
            <Link href="/privacy">Privacy Policy</Link>
            <Link href="/terms">Terms of Service</Link>
          </div>
        </div>
      </div>
    </footer>
  )
}
EOF

echo "✅ Footer component created"

# Create globals.css
cat > src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.5rem;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}
EOF

echo "✅ Global CSS created"

# Create Prisma seed file
cat > prisma/seed.ts << 'EOF'
import { PrismaClient } from '@prisma/client'
import bcrypt from 'bcryptjs'

const prisma = new PrismaClient()

async function main() {
  console.log('🌱 Seeding database...')

  // Create admin user
  const adminPassword = await bcrypt.hash('admin123', 10)
  const admin = await prisma.user.upsert({
    where: { email: 'admin@educonsultancy.vn' },
    update: {},
    create: {
      email: 'admin@educonsultancy.vn',
      password: adminPassword,
      name: 'Admin User',
      role: 'ADMIN',
      emailVerified: new Date(),
    },
  })

  // Create consultant user
  const consultantPassword = await bcrypt.hash('consultant123', 10)
  const consultant = await prisma.user.upsert({
    where: { email: 'consultant@educonsultancy.vn' },
    update: {},
    create: {
      email: 'consultant@educonsultancy.vn',
      password: consultantPassword,
      name: 'Nguyen Van A',
      role: 'CONSULTANT',
      emailVerified: new Date(),
      consultant: {
        create: {
          specialization: 'Engineering & IT',
          experience: 5,
        },
      },
    },
  })

  // Create sample universities
  const universities = [
    {
      name: 'University of Melbourne',
      nameVi: 'Đại học Melbourne',
      slug: 'university-of-melbourne',
      city: 'Melbourne',
      state: 'Victoria',
      ranking: 1,
      tuitionMin: 30000,
      tuitionMax: 45000,
      description: 'Top-ranked university in Australia, known for research excellence.',
      website: 'https://www.unimelb.edu.au',
    },
    {
      name: 'Australian National University',
      nameVi: 'Đại học Quốc gia Úc',
      slug: 'australian-national-university',
      city: 'Canberra',
      state: 'ACT',
      ranking: 2,
      tuitionMin: 32000,
      tuitionMax: 48000,
      description: 'Australia\'s national university with world-class research programs.',
      website: 'https://www.anu.edu.au',
    },
    {
      name: 'University of New South Wales',
      nameVi: 'Đại học New South Wales',
      slug: 'university-of-new-south-wales',
      city: 'Sydney',
      state: 'NSW',
      ranking: 3,
      tuitionMin: 35000,
      tuitionMax: 50000,
      description: 'Leading university known for engineering, business, and technology.',
      website: 'https://www.unsw.edu.au',
    },
  ]

  for (const uni of universities) {
    await prisma.university.upsert({
      where: { slug: uni.slug },
      update: {},
      create: uni,
    })
  }

  console.log('✅ Database seeded successfully!')
  console.log('')
  console.log('📝 Default accounts created:')
  console.log('Admin: admin@educonsultancy.vn / admin123')
  console.log('Consultant: consultant@educonsultancy.vn / consultant123')
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
EOF

echo "✅ Prisma seed file created"

echo ""
echo "=================================================="
echo "✅ All files created successfully!"
echo ""
echo "Next steps:"
echo "1. Run: npm install"
echo "2. Run: npx shadcn-ui@latest init"
echo "3. Run: npx shadcn-ui@latest add button card"
echo "4. Run: npx prisma generate"
echo "5. Run: npx prisma db push"
echo "6. Run: npx prisma db seed"
echo "7. Run: npm run dev"
echo ""
echo "🚀 Then open http://localhost:3000"
echo "=================================================="
