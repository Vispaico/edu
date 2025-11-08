#!/bin/bash

# Batch 3: Dashboard Pages Generator
echo "📊 Creating Dashboard Pages..."
echo "=============================="
echo ""

# Create dashboard structure
mkdir -p src/app/\(dashboard\)/{student,admin}/{dashboard,applications,universities,documents,tests,messages,settings}
mkdir -p src/app/\(dashboard\)/admin/{students,payments,blog}

# Create dashboard layout (shared sidebar)
cat > src/app/\(dashboard\)/layout.tsx << 'EOF'
'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Button } from '@/components/ui/button'

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const pathname = usePathname()
  const isStudent = pathname?.startsWith('/student')
  const isAdmin = pathname?.startsWith('/admin')

  const studentNav = [
    { name: 'Dashboard', href: '/student/dashboard', icon: '📊' },
    { name: 'Applications', href: '/student/applications', icon: '📝' },
    { name: 'Universities', href: '/student/universities', icon: '🎓' },
    { name: 'Documents', href: '/student/documents', icon: '📄' },
    { name: 'Tests', href: '/student/tests', icon: '📚' },
    { name: 'Messages', href: '/student/messages', icon: '💬' },
    { name: 'Settings', href: '/student/settings', icon: '⚙️' },
  ]

  const adminNav = [
    { name: 'Dashboard', href: '/admin/dashboard', icon: '📊' },
    { name: 'Students', href: '/admin/students', icon: '👥' },
    { name: 'Applications', href: '/admin/applications', icon: '📝' },
    { name: 'Universities', href: '/admin/universities', icon: '🎓' },
    { name: 'Payments', href: '/admin/payments', icon: '💰' },
    { name: 'Blog', href: '/admin/blog', icon: '📰' },
    { name: 'Settings', href: '/admin/settings', icon: '⚙️' },
  ]

  const navigation = isStudent ? studentNav : isAdmin ? adminNav : []

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="flex">
        {/* Sidebar */}
        <aside className="w-64 bg-white border-r min-h-screen fixed">
          <div className="p-4 border-b">
            <Link href="/" className="flex items-center gap-2">
              <div className="w-8 h-8 bg-blue-600 rounded-lg" />
              <span className="font-bold text-lg">Edu Consultancy</span>
            </Link>
          </div>

          <nav className="p-4 space-y-2">
            {navigation.map((item) => {
              const isActive = pathname === item.href
              return (
                <Link
                  key={item.href}
                  href={item.href}
                  className={`flex items-center gap-3 px-3 py-2 rounded-lg transition-colors ${
                    isActive
                      ? 'bg-blue-50 text-blue-600 font-medium'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  <span>{item.icon}</span>
                  <span>{item.name}</span>
                </Link>
              )
            })}
          </nav>

          <div className="absolute bottom-4 left-4 right-4">
            <Button variant="outline" className="w-full" asChild>
              <Link href="/login">Logout</Link>
            </Button>
          </div>
        </aside>

        {/* Main content */}
        <main className="ml-64 flex-1 p-8">
          {children}
        </main>
      </div>
    </div>
  )
}
EOF

echo "✅ Dashboard layout created"

# Student Dashboard Homepage
cat > src/app/\(dashboard\)/student/dashboard/page.tsx << 'EOF'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

export default function StudentDashboard() {
  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Welcome back, Student!</h1>
        <p className="text-gray-600">Here's an overview of your application progress</p>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Active Applications</CardDescription>
            <CardTitle className="text-3xl">2</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Documents Pending</CardDescription>
            <CardTitle className="text-3xl">3</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Test Scheduled</CardDescription>
            <CardTitle className="text-3xl">1</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Unread Messages</CardDescription>
            <CardTitle className="text-3xl">5</CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Current Applications */}
      <Card>
        <CardHeader>
          <CardTitle>Current Applications</CardTitle>
          <CardDescription>Track your university applications</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {[
              { uni: 'University of Melbourne', program: 'Master of Computer Science', status: 'Under Review', color: 'blue' },
              { uni: 'ANU', program: 'Master of Engineering', status: 'Documents Required', color: 'yellow' }
            ].map((app, idx) => (
              <div key={idx} className="flex items-center justify-between p-4 border rounded-lg">
                <div>
                  <h3 className="font-semibold">{app.uni}</h3>
                  <p className="text-sm text-gray-600">{app.program}</p>
                </div>
                <div className="flex items-center gap-4">
                  <span className={`px-3 py-1 rounded-full text-sm bg-${app.color}-50 text-${app.color}-600`}>
                    {app.status}
                  </span>
                  <Button size="sm" variant="outline">View</Button>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Visa Timeline */}
      <Card>
        <CardHeader>
          <CardTitle>Visa Application Timeline</CardTitle>
          <CardDescription>Australian Student Visa (Subclass 500)</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {[
              { step: 'Document Preparation', status: 'completed', date: 'Oct 15, 2024' },
              { step: 'Application Submitted', status: 'completed', date: 'Oct 22, 2024' },
              { step: 'Biometrics Done', status: 'completed', date: 'Oct 28, 2024' },
              { step: 'Medical Examination', status: 'current', date: 'Scheduled for Nov 10, 2024' },
              { step: 'Visa Decision', status: 'pending', date: 'Pending' }
            ].map((item, idx) => (
              <div key={idx} className="flex items-center gap-4">
                <div className={`w-8 h-8 rounded-full flex items-center justify-center ${
                  item.status === 'completed' ? 'bg-green-100 text-green-600' :
                  item.status === 'current' ? 'bg-blue-100 text-blue-600' :
                  'bg-gray-100 text-gray-400'
                }`}>
                  {item.status === 'completed' ? '✓' : idx + 1}
                </div>
                <div className="flex-1">
                  <h4 className="font-medium">{item.step}</h4>
                  <p className="text-sm text-gray-600">{item.date}</p>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Quick Actions */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card className="cursor-pointer hover:shadow-lg transition-shadow">
          <CardContent className="pt-6 text-center">
            <div className="text-4xl mb-2">📝</div>
            <h3 className="font-semibold mb-2">New Application</h3>
            <p className="text-sm text-gray-600 mb-4">Start a new university application</p>
            <Button asChild className="w-full">
              <Link href="/student/applications/new">Apply Now</Link>
            </Button>
          </CardContent>
        </Card>

        <Card className="cursor-pointer hover:shadow-lg transition-shadow">
          <CardContent className="pt-6 text-center">
            <div className="text-4xl mb-2">📄</div>
            <h3 className="font-semibold mb-2">Upload Documents</h3>
            <p className="text-sm text-gray-600 mb-4">Submit required documents</p>
            <Button asChild className="w-full" variant="outline">
              <Link href="/student/documents">Upload</Link>
            </Button>
          </CardContent>
        </Card>

        <Card className="cursor-pointer hover:shadow-lg transition-shadow">
          <CardContent className="pt-6 text-center">
            <div className="text-4xl mb-2">📚</div>
            <h3 className="font-semibold mb-2">Book Test</h3>
            <p className="text-sm text-gray-600 mb-4">Schedule IELTS, TOEFL, or PTE</p>
            <Button asChild className="w-full" variant="outline">
              <Link href="/student/tests">Book Now</Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
EOF

echo "✅ Student dashboard created"

# Admin Dashboard Homepage
cat > src/app/\(dashboard\)/admin/dashboard/page.tsx << 'EOF'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

export default function AdminDashboard() {
  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Admin Dashboard</h1>
        <p className="text-gray-600">Overview of platform activity and metrics</p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Total Students</CardDescription>
            <CardTitle className="text-3xl">156</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-green-600">+12 this month</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Active Applications</CardDescription>
            <CardTitle className="text-3xl">89</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-blue-600">24 pending review</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Visa Approvals</CardDescription>
            <CardTitle className="text-3xl">95%</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-green-600">Success rate</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Revenue This Month</CardDescription>
            <CardTitle className="text-3xl">₫45M</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-green-600">+18% vs last month</p>
          </CardContent>
        </Card>
      </div>

      {/* Recent Applications */}
      <Card>
        <CardHeader>
          <CardTitle>Recent Applications</CardTitle>
          <CardDescription>Latest university applications</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {[
              { student: 'Nguyen Van A', uni: 'University of Melbourne', status: 'Pending Review', date: 'Nov 5, 2024' },
              { student: 'Tran Thi B', uni: 'ANU', status: 'Documents Required', date: 'Nov 4, 2024' },
              { student: 'Le Van C', uni: 'UNSW', status: 'Offer Received', date: 'Nov 3, 2024' },
              { student: 'Pham Thi D', uni: 'Monash', status: 'Under Review', date: 'Nov 2, 2024' }
            ].map((app, idx) => (
              <div key={idx} className="flex items-center justify-between p-3 border rounded-lg">
                <div className="flex-1">
                  <h4 className="font-medium">{app.student}</h4>
                  <p className="text-sm text-gray-600">{app.uni}</p>
                </div>
                <div className="flex items-center gap-4">
                  <div className="text-right">
                    <p className="text-sm font-medium">{app.status}</p>
                    <p className="text-xs text-gray-500">{app.date}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Pending Actions */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card>
          <CardHeader>
            <CardTitle>Pending Document Verification</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-3">
              {[
                { student: 'Nguyen Van A', doc: 'Passport Copy', uploaded: '2 hours ago' },
                { student: 'Tran Thi B', doc: 'IELTS Certificate', uploaded: '5 hours ago' },
                { student: 'Le Van C', doc: 'Transcript', uploaded: '1 day ago' }
              ].map((item, idx) => (
                <div key={idx} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <p className="font-medium text-sm">{item.student}</p>
                    <p className="text-xs text-gray-600">{item.doc}</p>
                  </div>
                  <p className="text-xs text-gray-500">{item.uploaded}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Payment Verification</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-3">
              {[
                { student: 'Pham Thi D', amount: '₫5,000,000', type: 'Application Fee' },
                { student: 'Hoang Van E', amount: '₫3,000,000', type: 'Consultation Fee' },
                { student: 'Vo Thi F', amount: '₫2,000,000', type: 'Document Translation' }
              ].map((item, idx) => (
                <div key={idx} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                  <div>
                    <p className="font-medium text-sm">{item.student}</p>
                    <p className="text-xs text-gray-600">{item.type}</p>
                  </div>
                  <p className="font-semibold text-sm">{item.amount}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
EOF

echo "✅ Admin dashboard created"

# Student Applications Page
cat > src/app/\(dashboard\)/student/applications/page.tsx << 'EOF'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

export default function StudentApplicationsPage() {
  const applications = [
    {
      id: 1,
      university: 'University of Melbourne',
      program: 'Master of Computer Science',
      intake: 'February 2025',
      status: 'Under Review',
      submittedDate: '2024-10-20',
      lastUpdate: '2024-11-01'
    },
    {
      id: 2,
      university: 'Australian National University',
      program: 'Master of Engineering',
      intake: 'July 2025',
      status: 'Documents Required',
      submittedDate: '2024-10-25',
      lastUpdate: '2024-11-05'
    }
  ]

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">My Applications</h1>
          <p className="text-gray-600">Track and manage your university applications</p>
        </div>
        <Button asChild>
          <Link href="/student/applications/new">New Application</Link>
        </Button>
      </div>

      <div className="grid gap-6">
        {applications.map((app) => (
          <Card key={app.id}>
            <CardHeader>
              <div className="flex items-start justify-between">
                <div>
                  <CardTitle>{app.university}</CardTitle>
                  <CardDescription>{app.program}</CardDescription>
                </div>
                <span className="px-3 py-1 rounded-full text-sm bg-blue-50 text-blue-600">
                  {app.status}
                </span>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-3 gap-4 mb-4">
                <div>
                  <p className="text-sm text-gray-600">Intake</p>
                  <p className="font-medium">{app.intake}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Submitted</p>
                  <p className="font-medium">{app.submittedDate}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Last Update</p>
                  <p className="font-medium">{app.lastUpdate}</p>
                </div>
              </div>
              <Button variant="outline" className="w-full">View Details</Button>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
EOF

echo "✅ Student applications page created"

echo ""
echo "=============================="
echo "✅ Dashboard pages created!"
echo ""
echo "Created files:"
echo "  - src/app/(dashboard)/layout.tsx"
echo "  - src/app/(dashboard)/student/dashboard/page.tsx"
echo "  - src/app/(dashboard)/admin/dashboard/page.tsx"
echo "  - src/app/(dashboard)/student/applications/page.tsx"
echo ""
echo "You can now access (after login):"
echo "  - http://localhost:3000/student/dashboard"
echo "  - http://localhost:3000/admin/dashboard"
echo "  - http://localhost:3000/student/applications"
echo ""
echo "Demo Login Credentials:"
echo "  Student: student@test.com / student123"
echo "  Admin: admin@educonsultancy.vn / admin123"
echo "=============================="
