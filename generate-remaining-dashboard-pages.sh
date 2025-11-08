#!/bin/bash

# Batch 4: Complete All Missing Dashboard Pages
echo "📄 Creating All Missing Dashboard Pages..."
echo "==========================================="
echo ""

# Student - Documents Page
cat > src/app/\(dashboard\)/student/documents/page.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'

export default function StudentDocumentsPage() {
  const [uploading, setUploading] = useState(false)

  const documents = [
    { id: 1, name: 'Passport Copy', type: 'PASSPORT', status: 'Verified', uploadedDate: '2024-10-15', size: '2.3 MB' },
    { id: 2, name: 'IELTS Certificate', type: 'IELTS_CERTIFICATE', status: 'Verified', uploadedDate: '2024-10-18', size: '1.8 MB' },
    { id: 3, name: 'Bachelor Transcript', type: 'TRANSCRIPT', status: 'Pending', uploadedDate: '2024-11-01', size: '3.2 MB' },
    { id: 4, name: 'Recommendation Letter', type: 'RECOMMENDATION_LETTER', status: 'Rejected', uploadedDate: '2024-10-25', size: '1.5 MB' }
  ]

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files?.length) return
    setUploading(true)
    await new Promise(resolve => setTimeout(resolve, 2000))
    setUploading(false)
    alert('Document uploaded successfully!')
  }

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">My Documents</h1>
        <p className="text-gray-600">Upload and manage your application documents</p>
      </div>

      {/* Upload Section */}
      <Card>
        <CardHeader>
          <CardTitle>Upload New Document</CardTitle>
          <CardDescription>Supported formats: PDF, JPG, PNG (Max 10MB)</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="flex items-center gap-4">
            <Input
              type="file"
              accept=".pdf,.jpg,.jpeg,.png"
              onChange={handleFileUpload}
              disabled={uploading}
            />
            <Button disabled={uploading}>
              {uploading ? 'Uploading...' : 'Upload'}
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Documents List */}
      <div className="space-y-4">
        {documents.map((doc) => (
          <Card key={doc.id}>
            <CardContent className="pt-6">
              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <h3 className="font-semibold">{doc.name}</h3>
                  <p className="text-sm text-gray-600">
                    {doc.type} • {doc.size} • Uploaded {doc.uploadedDate}
                  </p>
                </div>
                <div className="flex items-center gap-4">
                  <span className={`px-3 py-1 rounded-full text-sm ${
                    doc.status === 'Verified' ? 'bg-green-50 text-green-600' :
                    doc.status === 'Pending' ? 'bg-yellow-50 text-yellow-600' :
                    'bg-red-50 text-red-600'
                  }`}>
                    {doc.status}
                  </span>
                  <Button size="sm" variant="outline">Download</Button>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
EOF

echo "✅ Student documents page created"

# Student - Tests Page
cat > src/app/\(dashboard\)/student/tests/page.tsx << 'EOF'
'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export default function StudentTestsPage() {
  const upcomingTests = [
    {
      id: 1,
      type: 'IELTS Academic',
      center: 'British Council - Hanoi UAC',
      date: '2024-11-15',
      time: '09:00 AM',
      status: 'Confirmed'
    }
  ]

  const pastTests = [
    {
      id: 2,
      type: 'IELTS Academic',
      date: '2024-09-20',
      score: 7.5,
      breakdown: 'L: 8.0, R: 7.5, W: 7.0, S: 7.5'
    }
  ]

  const testCenters = [
    { name: 'British Council - Hanoi UAC', location: 'Hanoi', provider: 'British Council' },
    { name: 'IDP IELTS - HCMC', location: 'Ho Chi Minh City', provider: 'IDP' },
    { name: 'British Council - HCMC UAC', location: 'Ho Chi Minh City', provider: 'British Council' }
  ]

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">Language Tests</h1>
          <p className="text-gray-600">Book and manage your IELTS, TOEFL, and PTE tests</p>
        </div>
        <Button>Book New Test</Button>
      </div>

      {/* Upcoming Tests */}
      <Card>
        <CardHeader>
          <CardTitle>Upcoming Tests</CardTitle>
          <CardDescription>Your scheduled language tests</CardDescription>
        </CardHeader>
        <CardContent>
          {upcomingTests.length > 0 ? (
            <div className="space-y-4">
              {upcomingTests.map((test) => (
                <div key={test.id} className="p-4 border rounded-lg">
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="font-semibold text-lg">{test.type}</h3>
                      <p className="text-sm text-gray-600 mt-1">{test.center}</p>
                      <p className="text-sm text-gray-600">
                        📅 {test.date} at {test.time}
                      </p>
                    </div>
                    <span className="px-3 py-1 rounded-full text-sm bg-green-50 text-green-600">
                      {test.status}
                    </span>
                  </div>
                  <div className="mt-4 flex gap-2">
                    <Button size="sm" variant="outline">View Details</Button>
                    <Button size="sm" variant="outline">Cancel</Button>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <p className="text-gray-500 text-center py-8">No upcoming tests scheduled</p>
          )}
        </CardContent>
      </Card>

      {/* Past Results */}
      <Card>
        <CardHeader>
          <CardTitle>Test Results</CardTitle>
          <CardDescription>Your previous test scores</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {pastTests.map((test) => (
              <div key={test.id} className="p-4 border rounded-lg">
                <div className="flex items-center justify-between">
                  <div>
                    <h3 className="font-semibold">{test.type}</h3>
                    <p className="text-sm text-gray-600">Test Date: {test.date}</p>
                    <p className="text-sm text-gray-600">{test.breakdown}</p>
                  </div>
                  <div className="text-right">
                    <div className="text-3xl font-bold text-blue-600">{test.score}</div>
                    <p className="text-sm text-gray-600">Overall</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Test Centers */}
      <Card>
        <CardHeader>
          <CardTitle>Test Centers in Vietnam</CardTitle>
          <CardDescription>Available IELTS test centers</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {testCenters.map((center, idx) => (
              <div key={idx} className="p-3 border rounded-lg flex items-center justify-between">
                <div>
                  <h4 className="font-medium">{center.name}</h4>
                  <p className="text-sm text-gray-600">{center.location} • {center.provider}</p>
                </div>
                <Button size="sm" variant="outline">View Schedule</Button>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Student tests page created"

# Student - Messages Page
cat > src/app/\(dashboard\)/student/messages/page.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'

export default function StudentMessagesPage() {
  const [newMessage, setNewMessage] = useState('')

  const messages = [
    {
      id: 1,
      from: 'Consultant',
      message: 'Hi! I reviewed your application to University of Melbourne. Your documents look good!',
      time: '2 hours ago',
      isFromStudent: false
    },
    {
      id: 2,
      from: 'You',
      message: 'Thank you! When can I expect to hear back from the university?',
      time: '1 hour ago',
      isFromStudent: true
    },
    {
      id: 3,
      from: 'Consultant',
      message: 'Typically 2-4 weeks. I will update you as soon as we hear from them.',
      time: '30 minutes ago',
      isFromStudent: false
    }
  ]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Messages</h1>
        <p className="text-gray-600">Chat with your education consultant</p>
      </div>

      <Card>
        <CardContent className="pt-6">
          {/* Messages Thread */}
          <div className="space-y-4 mb-6 h-96 overflow-y-auto">
            {messages.map((msg) => (
              <div
                key={msg.id}
                className={`flex ${msg.isFromStudent ? 'justify-end' : 'justify-start'}`}
              >
                <div
                  className={`max-w-md p-4 rounded-lg ${
                    msg.isFromStudent
                      ? 'bg-blue-600 text-white'
                      : 'bg-gray-100 text-gray-900'
                  }`}
                >
                  <p className="text-sm font-medium mb-1">{msg.from}</p>
                  <p>{msg.message}</p>
                  <p className={`text-xs mt-2 ${
                    msg.isFromStudent ? 'text-blue-100' : 'text-gray-500'
                  }`}>
                    {msg.time}
                  </p>
                </div>
              </div>
            ))}
          </div>

          {/* Message Input */}
          <div className="flex gap-2">
            <Textarea
              placeholder="Type your message..."
              value={newMessage}
              onChange={(e) => setNewMessage(e.target.value)}
              rows={3}
            />
            <Button className="self-end">Send</Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Student messages page created"

# Student - Settings Page
cat > src/app/\(dashboard\)/student/settings/page.tsx << 'EOF'
'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

export default function StudentSettingsPage() {
  return (
    <div className="space-y-8 max-w-2xl">
      <div>
        <h1 className="text-3xl font-bold mb-2">Settings</h1>
        <p className="text-gray-600">Manage your account settings and preferences</p>
      </div>

      {/* Profile Settings */}
      <Card>
        <CardHeader>
          <CardTitle>Profile Information</CardTitle>
          <CardDescription>Update your personal details</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="name">Full Name</Label>
            <Input id="name" defaultValue="Nguyen Van A" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input id="email" type="email" defaultValue="student@test.com" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="phone">Phone Number</Label>
            <Input id="phone" defaultValue="+84 123 456 789" />
          </div>
          <Button>Save Changes</Button>
        </CardContent>
      </Card>

      {/* Password */}
      <Card>
        <CardHeader>
          <CardTitle>Change Password</CardTitle>
          <CardDescription>Update your password</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="current">Current Password</Label>
            <Input id="current" type="password" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="new">New Password</Label>
            <Input id="new" type="password" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="confirm">Confirm New Password</Label>
            <Input id="confirm" type="password" />
          </div>
          <Button>Update Password</Button>
        </CardContent>
      </Card>

      {/* Notifications */}
      <Card>
        <CardHeader>
          <CardTitle>Notifications</CardTitle>
          <CardDescription>Manage how you receive updates</CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          <div className="flex items-center justify-between">
            <div>
              <p className="font-medium">Email Notifications</p>
              <p className="text-sm text-gray-600">Receive updates via email</p>
            </div>
            <input type="checkbox" defaultChecked className="w-4 h-4" />
          </div>
          <div className="flex items-center justify-between">
            <div>
              <p className="font-medium">Application Updates</p>
              <p className="text-sm text-gray-600">Get notified about application status changes</p>
            </div>
            <input type="checkbox" defaultChecked className="w-4 h-4" />
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Student settings page created"

# Admin - Students Page
cat > src/app/\(dashboard\)/admin/students/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'

export default function AdminStudentsPage() {
  const students = [
    { id: 1, name: 'Nguyen Van A', email: 'nguyenvana@email.com', phone: '+84 123 456 789', status: 'Active', applications: 2 },
    { id: 2, name: 'Tran Thi B', email: 'tranthib@email.com', phone: '+84 987 654 321', status: 'Active', applications: 1 },
    { id: 3, name: 'Le Van C', email: 'levanc@email.com', phone: '+84 555 666 777', status: 'Active', applications: 3 },
    { id: 4, name: 'Pham Thi D', email: 'phamthid@email.com', phone: '+84 111 222 333', status: 'Pending', applications: 0 }
  ]

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">Students</h1>
          <p className="text-gray-600">Manage all registered students</p>
        </div>
        <Button>Add New Student</Button>
      </div>

      {/* Search */}
      <div className="flex gap-4">
        <Input placeholder="Search students..." className="max-w-sm" />
        <Button variant="outline">Filter</Button>
      </div>

      {/* Students Table */}
      <Card>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {students.map((student) => (
              <div key={student.id} className="p-4 border rounded-lg flex items-center justify-between">
                <div className="flex-1">
                  <h3 className="font-semibold">{student.name}</h3>
                  <p className="text-sm text-gray-600">{student.email} • {student.phone}</p>
                </div>
                <div className="flex items-center gap-4">
                  <div className="text-right">
                    <p className="text-sm font-medium">{student.applications} Applications</p>
                    <span className={`text-xs px-2 py-1 rounded-full ${
                      student.status === 'Active' ? 'bg-green-50 text-green-600' : 'bg-yellow-50 text-yellow-600'
                    }`}>
                      {student.status}
                    </span>
                  </div>
                  <Button size="sm" variant="outline">View Details</Button>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin students page created"

# Admin - Applications Page
cat > src/app/\(dashboard\)/admin/applications/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export default function AdminApplicationsPage() {
  const applications = [
    { id: 1, student: 'Nguyen Van A', university: 'University of Melbourne', program: 'Master CS', status: 'Under Review', date: '2024-11-01' },
    { id: 2, student: 'Tran Thi B', university: 'ANU', program: 'Master Engineering', status: 'Documents Required', date: '2024-11-02' },
    { id: 3, student: 'Le Van C', university: 'UNSW', program: 'Master Business', status: 'Offer Received', date: '2024-10-28' },
    { id: 4, student: 'Pham Thi D', university: 'Monash', program: 'Master IT', status: 'Submitted', date: '2024-11-03' }
  ]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">All Applications</h1>
        <p className="text-gray-600">Manage and track all student applications</p>
      </div>

      <div className="grid grid-cols-4 gap-4">
        {[
          { label: 'Total', value: '89', color: 'blue' },
          { label: 'Pending Review', value: '24', color: 'yellow' },
          { label: 'Approved', value: '52', color: 'green' },
          { label: 'Rejected', value: '13', color: 'red' }
        ].map((stat, idx) => (
          <Card key={idx}>
            <CardContent className="pt-6">
              <p className="text-sm text-gray-600">{stat.label}</p>
              <p className="text-3xl font-bold mt-2">{stat.value}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      <Card>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {applications.map((app) => (
              <div key={app.id} className="p-4 border rounded-lg">
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <h3 className="font-semibold">{app.student}</h3>
                    <p className="text-sm text-gray-600">{app.university} - {app.program}</p>
                    <p className="text-xs text-gray-500 mt-1">{app.date}</p>
                  </div>
                  <div className="flex items-center gap-4">
                    <span className="px-3 py-1 rounded-full text-sm bg-blue-50 text-blue-600">
                      {app.status}
                    </span>
                    <Button size="sm" variant="outline">Review</Button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin applications page created"

# Admin - Payments Page
cat > src/app/\(dashboard\)/admin/payments/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export default function AdminPaymentsPage() {
  const payments = [
    { id: 1, student: 'Nguyen Van A', amount: '₫5,000,000', type: 'Application Fee', method: 'Bank Transfer', status: 'Pending', date: '2024-11-05' },
    { id: 2, student: 'Tran Thi B', amount: '₫3,000,000', type: 'Consultation Fee', method: 'VietQR', status: 'Verified', date: '2024-11-04' },
    { id: 3, student: 'Le Van C', amount: '₫2,000,000', type: 'Document Translation', method: 'Bank Transfer', status: 'Completed', date: '2024-11-03' }
  ]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Payment Management</h1>
        <p className="text-gray-600">Track and verify student payments</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-6">
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Total This Month</p>
            <p className="text-3xl font-bold mt-2">₫45M</p>
            <p className="text-sm text-green-600 mt-1">+18% vs last month</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Pending Verification</p>
            <p className="text-3xl font-bold mt-2">8</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Completed</p>
            <p className="text-3xl font-bold mt-2">142</p>
          </CardContent>
        </Card>
      </div>

      {/* Payments List */}
      <Card>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {payments.map((payment) => (
              <div key={payment.id} className="p-4 border rounded-lg">
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <h3 className="font-semibold">{payment.student}</h3>
                    <p className="text-sm text-gray-600">{payment.type} • {payment.method}</p>
                    <p className="text-xs text-gray-500 mt-1">{payment.date}</p>
                  </div>
                  <div className="flex items-center gap-4">
                    <div className="text-right">
                      <p className="font-bold">{payment.amount}</p>
                      <span className={`text-xs px-2 py-1 rounded-full ${
                        payment.status === 'Completed' ? 'bg-green-50 text-green-600' :
                        payment.status === 'Verified' ? 'bg-blue-50 text-blue-600' :
                        'bg-yellow-50 text-yellow-600'
                      }`}>
                        {payment.status}
                      </span>
                    </div>
                    {payment.status === 'Pending' && (
                      <Button size="sm">Verify</Button>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin payments page created"

# Admin - Universities Page (reuse from student, make editable)
cat > src/app/\(dashboard\)/admin/universities/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export default function AdminUniversitiesPage() {
  const universities = [
    { id: 1, name: 'University of Melbourne', city: 'Melbourne', programs: 45, students: 23 },
    { id: 2, name: 'Australian National University', city: 'Canberra', programs: 38, students: 18 },
    { id: 3, name: 'UNSW', city: 'Sydney', programs: 52, students: 31 }
  ]

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">Universities</h1>
          <p className="text-gray-600">Manage partner universities and programs</p>
        </div>
        <Button>Add University</Button>
      </div>

      <Card>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {universities.map((uni) => (
              <div key={uni.id} className="p-4 border rounded-lg flex items-center justify-between">
                <div>
                  <h3 className="font-semibold text-lg">{uni.name}</h3>
                  <p className="text-sm text-gray-600">{uni.city} • {uni.programs} programs • {uni.students} students</p>
                </div>
                <div className="flex gap-2">
                  <Button size="sm" variant="outline">Edit</Button>
                  <Button size="sm" variant="outline">View</Button>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin universities page created"

# Student - Universities (browse)
cat > src/app/\(dashboard\)/student/universities/page.tsx << 'EOF'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export default function StudentUniversitiesPage() {
  const universities = [
    { id: 1, name: 'University of Melbourne', city: 'Melbourne', ranking: '#1', programs: 45 },
    { id: 2, name: 'Australian National University', city: 'Canberra', ranking: '#2', programs: 38 },
    { id: 3, name: 'UNSW', city: 'Sydney', ranking: '#3', programs: 52 },
    { id: 4, name: 'University of Sydney', city: 'Sydney', ranking: '#4', programs: 48 }
  ]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold mb-2">Browse Universities</h1>
        <p className="text-gray-600">Explore Australian universities and programs</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {universities.map((uni) => (
          <Card key={uni.id}>
            <CardHeader>
              <CardTitle>{uni.name}</CardTitle>
              <CardDescription>{uni.city} • {uni.ranking} in Australia</CardDescription>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-gray-600 mb-4">{uni.programs} programs available</p>
              <Button className="w-full">View Programs</Button>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
EOF

echo "✅ Student universities page created"

echo ""
echo "==========================================="
echo "✅ All missing dashboard pages created!"
echo ""
echo "Student pages:"
echo "  - Documents, Tests, Messages, Settings, Universities"
echo ""
echo "Admin pages:"
echo "  - Students, Applications, Payments, Universities"
echo ""
echo "All sidebar links now work! 🎉"
echo "==========================================="
