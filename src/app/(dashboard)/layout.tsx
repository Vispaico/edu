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
