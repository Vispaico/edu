#!/bin/bash

# Batch 2: Public Pages Generator
echo "📄 Creating Public Pages..."
echo "============================"
echo ""

# Create public pages structure
mkdir -p src/app/{universities,services,about,contact,blog,faq,privacy,terms}

# Universities listing page
cat > src/app/universities/page.tsx << 'EOF'
import Link from 'next/link'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

const universities = [
  {
    id: 1,
    name: 'University of Melbourne',
    city: 'Melbourne',
    state: 'Victoria',
    ranking: '#1 in Australia',
    tuition: 'AUD $30,000 - $45,000/year',
    logo: '🎓',
    slug: 'university-of-melbourne'
  },
  {
    id: 2,
    name: 'Australian National University',
    city: 'Canberra',
    state: 'ACT',
    ranking: '#2 in Australia',
    tuition: 'AUD $32,000 - $48,000/year',
    logo: '🏛️',
    slug: 'australian-national-university'
  },
  {
    id: 3,
    name: 'University of New South Wales',
    city: 'Sydney',
    state: 'NSW',
    ranking: '#3 in Australia',
    tuition: 'AUD $35,000 - $50,000/year',
    logo: '🎯',
    slug: 'university-of-new-south-wales'
  },
  {
    id: 4,
    name: 'University of Sydney',
    city: 'Sydney',
    state: 'NSW',
    ranking: '#4 in Australia',
    tuition: 'AUD $33,000 - $49,000/year',
    logo: '📚',
    slug: 'university-of-sydney'
  },
  {
    id: 5,
    name: 'Monash University',
    city: 'Melbourne',
    state: 'Victoria',
    ranking: '#5 in Australia',
    tuition: 'AUD $30,000 - $44,000/year',
    logo: '🔬',
    slug: 'monash-university'
  },
  {
    id: 6,
    name: 'University of Queensland',
    city: 'Brisbane',
    state: 'Queensland',
    ranking: '#6 in Australia',
    tuition: 'AUD $31,000 - $46,000/year',
    logo: '🌟',
    slug: 'university-of-queensland'
  }
]

export default function UniversitiesPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        <div className="max-w-4xl mx-auto text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            Australian Universities
          </h1>
          <p className="text-xl text-gray-600">
            Browse top-ranked universities offering world-class education
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto">
          {universities.map((uni) => (
            <Card key={uni.id} className="hover:shadow-lg transition-shadow">
              <CardHeader>
                <div className="text-4xl mb-2">{uni.logo}</div>
                <CardTitle className="text-lg">{uni.name}</CardTitle>
                <CardDescription>{uni.city}, {uni.state}</CardDescription>
              </CardHeader>
              <CardContent className="space-y-2">
                <div className="text-sm">
                  <span className="font-semibold">Ranking:</span> {uni.ranking}
                </div>
                <div className="text-sm">
                  <span className="font-semibold">Tuition:</span> {uni.tuition}
                </div>
                <Button asChild className="w-full mt-4">
                  <Link href={`/universities/${uni.slug}`}>View Details</Link>
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  )
}
EOF

echo "✅ Universities page created"

# Services page
cat > src/app/services/page.tsx << 'EOF'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

const services = [
  {
    icon: '🎓',
    title: 'University Selection',
    description: 'Expert guidance to choose the right university and program matching your goals, budget, and career aspirations.',
    features: [
      'Personalized university recommendations',
      'Program comparison and analysis',
      'Career outcome insights',
      'Scholarship opportunities'
    ]
  },
  {
    icon: '📝',
    title: 'Application Support',
    description: 'Complete assistance with university applications, from document preparation to submission.',
    features: [
      'Application form completion',
      'Document verification',
      'Statement of Purpose editing',
      'Recommendation letter guidance'
    ]
  },
  {
    icon: '✈️',
    title: 'Visa Processing',
    description: 'Step-by-step support for Australian student visa (Subclass 500) with high success rate.',
    features: [
      'Visa eligibility assessment',
      'Document preparation',
      'Application lodgement',
      'Interview preparation'
    ]
  },
  {
    icon: '📚',
    title: 'Test Preparation',
    description: 'IELTS, TOEFL, and PTE test booking assistance and preparation resources.',
    features: [
      'Test center booking',
      'Study materials',
      'Practice tests',
      'Score improvement tips'
    ]
  },
  {
    icon: '💼',
    title: 'Career Counseling',
    description: 'Professional advice on career paths and job prospects in Australia.',
    features: [
      'Industry insights',
      'Job market analysis',
      'Resume building',
      'Interview preparation'
    ]
  },
  {
    icon: '🏠',
    title: 'Pre-Departure Support',
    description: 'Accommodation, travel, and settlement assistance for your move to Australia.',
    features: [
      'Accommodation booking',
      'Airport pickup arrangement',
      'Bank account setup',
      'Orientation sessions'
    ]
  }
]

export default function ServicesPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-gradient-to-b from-blue-600 to-blue-700 text-white py-20">
        <div className="container mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            Our Services
          </h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto">
            Comprehensive support for every step of your study abroad journey
          </p>
        </div>
      </section>

      {/* Services Grid */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
            {services.map((service, index) => (
              <Card key={index} className="h-full">
                <CardHeader>
                  <div className="text-4xl mb-2">{service.icon}</div>
                  <CardTitle>{service.title}</CardTitle>
                  <CardDescription>{service.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {service.features.map((feature, idx) => (
                      <li key={idx} className="flex items-start gap-2 text-sm">
                        <span className="text-green-600 mt-1">✓</span>
                        <span>{feature}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Get Started?</h2>
          <p className="text-gray-600 mb-8 max-w-2xl mx-auto">
            Schedule a free consultation with our expert advisors
          </p>
          <Button size="lg" asChild>
            <Link href="/contact">Book Free Consultation</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}
EOF

echo "✅ Services page created"

# About page
cat > src/app/about/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <section className="bg-gradient-to-b from-blue-600 to-blue-700 text-white py-20">
        <div className="container mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">About Us</h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto">
            Your trusted partner for studying in Australia since 2014
          </p>
        </div>
      </section>

      {/* Our Story */}
      <section className="py-16">
        <div className="container mx-auto px-4 max-w-4xl">
          <h2 className="text-3xl font-bold text-center mb-8">Our Story</h2>
          <div className="prose prose-lg mx-auto text-gray-600">
            <p>
              Founded in 2014, Edu Consultancy has helped over 500 Vietnamese students
              achieve their dream of studying at top Australian universities. Our team
              of experienced education consultants understands the unique challenges
              Vietnamese students face and provides personalized support throughout
              the entire process.
            </p>
            <p>
              We maintain strong partnerships with over 50 Australian universities
              and have achieved a 95% visa success rate. Our commitment to excellence
              and personalized service has made us one of the most trusted education
              consultancies in Vietnam.
            </p>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-4xl mx-auto text-center">
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

      {/* Team */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Our Team</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto">
            {[
              { name: 'Nguyen Van A', role: 'Founder & CEO', exp: '15 years experience' },
              { name: 'Tran Thi B', role: 'Senior Consultant', exp: '10 years experience' },
              { name: 'Le Van C', role: 'Visa Specialist', exp: '8 years experience' }
            ].map((member, idx) => (
              <Card key={idx}>
                <CardContent className="pt-6 text-center">
                  <div className="w-24 h-24 bg-blue-100 rounded-full mx-auto mb-4" />
                  <h3 className="font-semibold text-lg">{member.name}</h3>
                  <p className="text-gray-600 text-sm">{member.role}</p>
                  <p className="text-gray-500 text-xs mt-1">{member.exp}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-blue-600 text-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Start Your Journey Today</h2>
          <p className="mb-8 max-w-2xl mx-auto">
            Let us help you achieve your dream of studying in Australia
          </p>
          <Button size="lg" variant="secondary" asChild>
            <Link href="/contact">Contact Us</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}
EOF

echo "✅ About page created"

# Contact page
cat > src/app/contact/page.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    message: ''
  })
  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    // TODO: Implement contact form API
    await new Promise(resolve => setTimeout(resolve, 1000))
    setSubmitted(true)
  }

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    setFormData(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        <div className="max-w-4xl mx-auto text-center mb-12">
          <h1 className="text-4xl font-bold mb-4">Contact Us</h1>
          <p className="text-xl text-gray-600">
            Get in touch with our team of expert advisors
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-5xl mx-auto">
          {/* Contact Form */}
          <Card>
            <CardHeader>
              <CardTitle>Send us a message</CardTitle>
            </CardHeader>
            <CardContent>
              {submitted ? (
                <div className="text-center py-8">
                  <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <svg className="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                    </svg>
                  </div>
                  <h3 className="text-lg font-semibold mb-2">Message Sent!</h3>
                  <p className="text-gray-600">We'll get back to you within 24 hours.</p>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="name">Full Name</Label>
                    <Input id="name" name="name" value={formData.name} onChange={handleChange} required />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="email">Email</Label>
                    <Input id="email" name="email" type="email" value={formData.email} onChange={handleChange} required />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="phone">Phone</Label>
                    <Input id="phone" name="phone" type="tel" value={formData.phone} onChange={handleChange} required />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="message">Message</Label>
                    <Textarea id="message" name="message" rows={4} value={formData.message} onChange={handleChange} required />
                  </div>
                  <Button type="submit" className="w-full">Send Message</Button>
                </form>
              )}
            </CardContent>
          </Card>

          {/* Contact Info */}
          <div className="space-y-6">
            <Card>
              <CardContent className="pt-6">
                <h3 className="font-semibold mb-4">📍 Office Location</h3>
                <p className="text-gray-600">
                  123 Example Street<br />
                  Hanoi, Vietnam
                </p>
              </CardContent>
            </Card>

            <Card>
              <CardContent className="pt-6">
                <h3 className="font-semibold mb-4">📞 Phone</h3>
                <p className="text-gray-600">+84 123 456 789</p>
              </CardContent>
            </Card>

            <Card>
              <CardContent className="pt-6">
                <h3 className="font-semibold mb-4">✉️ Email</h3>
                <p className="text-gray-600">info@educonsultancy.vn</p>
              </CardContent>
            </Card>

            <Card>
              <CardContent className="pt-6">
                <h3 className="font-semibold mb-4">🕐 Office Hours</h3>
                <p className="text-gray-600">
                  Mon - Fri: 9:00 AM - 6:00 PM<br />
                  Sat: 9:00 AM - 1:00 PM<br />
                  Sun: Closed
                </p>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
EOF

echo "✅ Contact page created"

# FAQ page
cat > src/app/faq/page.tsx << 'EOF'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'

const faqs = [
  {
    question: 'How long does the application process take?',
    answer: 'The entire process from application to visa approval typically takes 3-6 months, depending on the university and visa processing times.'
  },
  {
    question: 'What are the English language requirements?',
    answer: 'Most universities require IELTS 6.5-7.0 (or equivalent TOEFL/PTE scores). Requirements vary by program and institution.'
  },
  {
    question: 'How much does it cost to study in Australia?',
    answer: 'Tuition fees range from AUD $20,000 to $50,000 per year. Living expenses are approximately AUD $21,000 per year.'
  },
  {
    question: 'Can I work while studying?',
    answer: 'Yes, international students can work up to 48 hours per fortnight during semester and unlimited hours during breaks.'
  },
  {
    question: 'Do you help with accommodation?',
    answer: 'Yes, we provide assistance with finding suitable accommodation including on-campus housing, homestays, and shared apartments.'
  },
  {
    question: 'What is your success rate for visa applications?',
    answer: 'We maintain a 95% visa success rate through careful preparation and guidance throughout the application process.'
  }
]

export default function FAQPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        <div className="max-w-3xl mx-auto">
          <div className="text-center mb-12">
            <h1 className="text-4xl font-bold mb-4">Frequently Asked Questions</h1>
            <p className="text-xl text-gray-600">
              Find answers to common questions about studying in Australia
            </p>
          </div>

          <div className="space-y-4">
            {faqs.map((faq, idx) => (
              <Card key={idx}>
                <CardHeader>
                  <CardTitle className="text-lg">{faq.question}</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-gray-600">{faq.answer}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
EOF

echo "✅ FAQ page created"

echo ""
echo "============================"
echo "✅ Public pages created!"
echo ""
echo "Created files:"
echo "  - src/app/universities/page.tsx"
echo "  - src/app/services/page.tsx"
echo "  - src/app/about/page.tsx"
echo "  - src/app/contact/page.tsx"
echo "  - src/app/faq/page.tsx"
echo ""
echo "You can now access:"
echo "  - http://localhost:3000/universities"
echo "  - http://localhost:3000/services"
echo "  - http://localhost:3000/about"
echo "  - http://localhost:3000/contact"
echo "  - http://localhost:3000/faq"
echo "============================"
