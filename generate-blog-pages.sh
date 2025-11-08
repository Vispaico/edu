#!/bin/bash

# Batch 5: Blog Pages Generator
echo "📰 Creating Blog Pages..."
echo "========================="
echo ""

# Public Blog Listing Page
cat > src/app/blog/page.tsx << 'EOF'
import Link from 'next/link'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

const blogPosts = [
  {
    id: 1,
    slug: 'top-universities-australia-2025',
    title: 'Top 10 Universities in Australia for International Students 2025',
    excerpt: 'Discover the best Australian universities offering world-class education, research opportunities, and excellent career prospects.',
    category: 'Universities',
    author: 'Education Team',
    date: '2024-11-05',
    readTime: '5 min read',
    image: '📚'
  },
  {
    id: 2,
    slug: 'ielts-preparation-tips',
    title: 'IELTS Preparation: 10 Tips to Achieve Your Target Score',
    excerpt: 'Essential strategies and study techniques to help you prepare for IELTS and achieve the score you need for university admission.',
    category: 'Test Prep',
    author: 'Language Expert',
    date: '2024-11-03',
    readTime: '7 min read',
    image: '✍️'
  },
  {
    id: 3,
    slug: 'student-visa-guide-2025',
    title: 'Complete Guide to Australian Student Visa (Subclass 500) 2025',
    excerpt: 'Step-by-step guide covering requirements, documents, application process, and tips for successful visa approval.',
    category: 'Visa',
    author: 'Visa Specialist',
    date: '2024-11-01',
    readTime: '10 min read',
    image: '✈️'
  },
  {
    id: 4,
    slug: 'cost-of-living-australia',
    title: 'Cost of Living for International Students in Australia',
    excerpt: 'Breakdown of expenses including accommodation, food, transport, and entertainment in major Australian cities.',
    category: 'Student Life',
    author: 'Student Advisor',
    date: '2024-10-28',
    readTime: '6 min read',
    image: '💰'
  },
  {
    id: 5,
    slug: 'scholarships-vietnamese-students',
    title: 'Top Scholarships for Vietnamese Students in Australia',
    excerpt: 'Comprehensive list of scholarships, grants, and financial aid opportunities available for Vietnamese students.',
    category: 'Scholarships',
    author: 'Financial Advisor',
    date: '2024-10-25',
    readTime: '8 min read',
    image: '🎓'
  },
  {
    id: 6,
    slug: 'choosing-right-course',
    title: 'How to Choose the Right Course and University',
    excerpt: 'Key factors to consider when selecting your program and institution in Australia for the best career outcomes.',
    category: 'Career Advice',
    author: 'Career Counselor',
    date: '2024-10-22',
    readTime: '9 min read',
    image: '🎯'
  }
]

const categories = ['All', 'Universities', 'Test Prep', 'Visa', 'Student Life', 'Scholarships', 'Career Advice']

export default function BlogPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="max-w-4xl mx-auto text-center mb-12">
          <h1 className="text-4xl font-bold mb-4">Study Abroad Blog</h1>
          <p className="text-xl text-gray-600">
            Tips, guides, and insights for Vietnamese students studying in Australia
          </p>
        </div>

        {/* Categories Filter */}
        <div className="max-w-6xl mx-auto mb-8">
          <div className="flex gap-2 flex-wrap justify-center">
            {categories.map((cat) => (
              <Button
                key={cat}
                variant={cat === 'All' ? 'default' : 'outline'}
                size="sm"
              >
                {cat}
              </Button>
            ))}
          </div>
        </div>

        {/* Blog Grid */}
        <div className="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {blogPosts.map((post) => (
            <Card key={post.id} className="hover:shadow-lg transition-shadow">
              <CardHeader>
                <div className="text-4xl mb-2">{post.image}</div>
                <div className="flex items-center gap-2 text-sm text-gray-600 mb-2">
                  <span className="px-2 py-1 bg-blue-50 text-blue-600 rounded-full text-xs font-medium">
                    {post.category}
                  </span>
                  <span>{post.readTime}</span>
                </div>
                <CardTitle className="text-lg line-clamp-2">{post.title}</CardTitle>
                <CardDescription className="line-clamp-2">{post.excerpt}</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex items-center justify-between text-sm">
                  <span className="text-gray-600">{post.author}</span>
                  <span className="text-gray-500">{post.date}</span>
                </div>
                <Button asChild className="w-full mt-4" variant="outline">
                  <Link href={`/blog/${post.slug}`}>Read More</Link>
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Newsletter CTA */}
        <div className="max-w-2xl mx-auto mt-16">
          <Card className="bg-blue-50">
            <CardContent className="pt-6 text-center">
              <h3 className="text-2xl font-bold mb-2">Subscribe to Our Newsletter</h3>
              <p className="text-gray-600 mb-6">
                Get the latest articles, tips, and updates delivered to your inbox
              </p>
              <div className="flex gap-2 max-w-md mx-auto">
                <input
                  type="email"
                  placeholder="Enter your email"
                  className="flex-1 px-4 py-2 rounded-lg border"
                />
                <Button>Subscribe</Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
EOF

echo "✅ Public blog listing page created"

# Blog Post Detail Page (example)
cat > src/app/blog/[slug]/page.tsx << 'EOF'
import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

// This would normally fetch from database
export default function BlogPostPage({ params }: { params: { slug: string } }) {
  const post = {
    title: 'Top 10 Universities in Australia for International Students 2025',
    author: 'Education Team',
    date: '2024-11-05',
    readTime: '5 min read',
    category: 'Universities',
    image: '📚',
    content: `
# Introduction

Australia has become one of the most popular destinations for international students, offering world-class education, diverse culture, and excellent career opportunities. In this comprehensive guide, we'll explore the top universities that welcome Vietnamese students.

## 1. University of Melbourne

Consistently ranked #1 in Australia, the University of Melbourne offers exceptional programs across all disciplines. The university is particularly strong in:

- Computer Science and IT
- Engineering
- Business and Commerce
- Medicine and Health Sciences

**Key Facts:**
- QS World Ranking: #14
- International Students: 45%
- Average Tuition: AUD $35,000 - $50,000/year

## 2. Australian National University (ANU)

Located in Canberra, ANU is Australia's national university with world-leading research programs.

**Strengths:**
- Politics and International Studies
- Science and Research
- Economics
- Asia-Pacific Studies

## 3. University of New South Wales (UNSW)

Known for innovation and entrepreneurship, UNSW excels in:
- Engineering
- Business
- Technology
- Law

## Application Tips

When applying to these universities:

1. **Start Early**: Begin your application 6-9 months before intake
2. **Strong Academic Record**: Maintain high GPA
3. **English Proficiency**: Achieve required IELTS/TOEFL scores
4. **Personal Statement**: Highlight your unique experiences
5. **References**: Obtain strong recommendation letters

## Scholarships Available

Many universities offer scholarships for international students:

- Melbourne Global Scholars Award
- ANU Chancellor's International Scholarship
- UNSW International Scholarships

## Conclusion

Choosing the right university is a crucial decision. Consider factors like program strength, location, cost, and career prospects. Our team at Edu Consultancy can help guide you through the application process.

**Ready to apply?** Contact us for a free consultation.
    `
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <article className="container mx-auto px-4 max-w-4xl">
        {/* Back Button */}
        <div className="mb-8">
          <Button variant="ghost" asChild>
            <Link href="/blog">← Back to Blog</Link>
          </Button>
        </div>

        {/* Article Header */}
        <div className="bg-white rounded-lg p-8 mb-8 shadow-sm">
          <div className="flex items-center gap-2 mb-4">
            <span className="px-3 py-1 bg-blue-50 text-blue-600 rounded-full text-sm font-medium">
              {post.category}
            </span>
            <span className="text-gray-600 text-sm">{post.readTime}</span>
          </div>
          
          <div className="text-6xl mb-6">{post.image}</div>
          
          <h1 className="text-4xl font-bold mb-4">{post.title}</h1>
          
          <div className="flex items-center gap-4 text-gray-600">
            <span>By {post.author}</span>
            <span>•</span>
            <span>{post.date}</span>
          </div>
        </div>

        {/* Article Content */}
        <div className="bg-white rounded-lg p-8 shadow-sm prose prose-lg max-w-none">
          <div className="whitespace-pre-line">{post.content}</div>
        </div>

        {/* CTA Section */}
        <Card className="mt-12 bg-blue-50">
          <CardContent className="pt-6 text-center">
            <h3 className="text-2xl font-bold mb-4">Need Help with Your Application?</h3>
            <p className="text-gray-600 mb-6">
              Our expert consultants can guide you through every step of the application process
            </p>
            <Button size="lg" asChild>
              <Link href="/contact">Book Free Consultation</Link>
            </Button>
          </CardContent>
        </Card>

        {/* Related Posts */}
        <div className="mt-12">
          <h3 className="text-2xl font-bold mb-6">Related Articles</h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {[1, 2, 3].map((i) => (
              <Card key={i}>
                <CardContent className="pt-6">
                  <div className="text-3xl mb-2">📝</div>
                  <h4 className="font-semibold mb-2">Related Article {i}</h4>
                  <p className="text-sm text-gray-600 mb-4">Short description of the article...</p>
                  <Button size="sm" variant="outline" className="w-full">Read More</Button>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </article>
    </div>
  )
}
EOF

echo "✅ Blog post detail page created"

# Admin Blog Management Page
cat > src/app/\(dashboard\)/admin/blog/page.tsx << 'EOF'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import Link from 'next/link'

export default function AdminBlogPage() {
  const posts = [
    { id: 1, title: 'Top 10 Universities in Australia', status: 'Published', views: 1234, date: '2024-11-05' },
    { id: 2, title: 'IELTS Preparation Tips', status: 'Published', views: 892, date: '2024-11-03' },
    { id: 3, title: 'Student Visa Guide 2025', status: 'Published', views: 2156, date: '2024-11-01' },
    { id: 4, title: 'Cost of Living in Australia', status: 'Draft', views: 0, date: '2024-10-30' }
  ]

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">Blog Management</h1>
          <p className="text-gray-600">Create and manage blog posts</p>
        </div>
        <Button asChild>
          <Link href="/admin/blog/new">Create New Post</Link>
        </Button>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-4 gap-6">
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Total Posts</p>
            <p className="text-3xl font-bold mt-2">24</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Published</p>
            <p className="text-3xl font-bold mt-2">18</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Drafts</p>
            <p className="text-3xl font-bold mt-2">6</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <p className="text-sm text-gray-600">Total Views</p>
            <p className="text-3xl font-bold mt-2">45.2K</p>
          </CardContent>
        </Card>
      </div>

      {/* Search */}
      <div className="flex gap-4">
        <Input placeholder="Search posts..." className="max-w-sm" />
        <Button variant="outline">Filter</Button>
      </div>

      {/* Posts List */}
      <Card>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {posts.map((post) => (
              <div key={post.id} className="p-4 border rounded-lg">
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <h3 className="font-semibold">{post.title}</h3>
                    <div className="flex items-center gap-4 mt-1 text-sm text-gray-600">
                      <span>{post.date}</span>
                      <span>•</span>
                      <span>{post.views} views</span>
                      <span>•</span>
                      <span className={`px-2 py-1 rounded-full text-xs ${
                        post.status === 'Published' 
                          ? 'bg-green-50 text-green-600' 
                          : 'bg-yellow-50 text-yellow-600'
                      }`}>
                        {post.status}
                      </span>
                    </div>
                  </div>
                  <div className="flex gap-2">
                    <Button size="sm" variant="outline">Edit</Button>
                    <Button size="sm" variant="outline">View</Button>
                    <Button size="sm" variant="outline">Delete</Button>
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

echo "✅ Admin blog management page created"

# Admin Blog New Post Page
cat > src/app/\(dashboard\)/admin/blog/new/page.tsx << 'EOF'
'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import Link from 'next/link'

export default function NewBlogPostPage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold mb-2">Create New Blog Post</h1>
          <p className="text-gray-600">Write and publish a new article</p>
        </div>
        <Button variant="ghost" asChild>
          <Link href="/admin/blog">← Back</Link>
        </Button>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Post Details</CardTitle>
          <CardDescription>Fill in the information for your blog post</CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="space-y-2">
            <Label htmlFor="title">Title</Label>
            <Input
              id="title"
              placeholder="Enter post title"
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="slug">URL Slug</Label>
            <Input
              id="slug"
              placeholder="enter-post-slug"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="category">Category</Label>
              <select id="category" className="w-full px-3 py-2 border rounded-lg">
                <option>Universities</option>
                <option>Test Prep</option>
                <option>Visa</option>
                <option>Student Life</option>
                <option>Scholarships</option>
                <option>Career Advice</option>
              </select>
            </div>

            <div className="space-y-2">
              <Label htmlFor="author">Author</Label>
              <Input id="author" defaultValue="Education Team" />
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="excerpt">Excerpt</Label>
            <Textarea
              id="excerpt"
              placeholder="Brief description of the post (150 characters max)"
              rows={2}
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="content">Content</Label>
            <Textarea
              id="content"
              placeholder="Write your blog post content here... (Markdown supported)"
              rows={15}
            />
          </div>

          <div className="flex gap-4">
            <Button>Publish Post</Button>
            <Button variant="outline">Save as Draft</Button>
            <Button variant="ghost">Preview</Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin new blog post page created"

# Admin Settings Page
cat > src/app/\(dashboard\)/admin/settings/page.tsx << 'EOF'
'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

export default function AdminSettingsPage() {
  return (
    <div className="space-y-8 max-w-2xl">
      <div>
        <h1 className="text-3xl font-bold mb-2">Admin Settings</h1>
        <p className="text-gray-600">Manage platform settings and configuration</p>
      </div>

      {/* Profile */}
      <Card>
        <CardHeader>
          <CardTitle>Admin Profile</CardTitle>
          <CardDescription>Your account information</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="name">Name</Label>
            <Input id="name" defaultValue="Admin User" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input id="email" type="email" defaultValue="admin@educonsultancy.vn" />
          </div>
          <Button>Save Changes</Button>
        </CardContent>
      </Card>

      {/* Platform Settings */}
      <Card>
        <CardHeader>
          <CardTitle>Platform Settings</CardTitle>
          <CardDescription>General platform configuration</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="siteName">Site Name</Label>
            <Input id="siteName" defaultValue="Edu Consultancy" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="contactEmail">Contact Email</Label>
            <Input id="contactEmail" defaultValue="info@educonsultancy.vn" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="phone">Contact Phone</Label>
            <Input id="phone" defaultValue="+84 123 456 789" />
          </div>
          <Button>Update Settings</Button>
        </CardContent>
      </Card>

      {/* Email Configuration */}
      <Card>
        <CardHeader>
          <CardTitle>Email Configuration</CardTitle>
          <CardDescription>SMTP settings for sending emails</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="smtpHost">SMTP Host</Label>
            <Input id="smtpHost" defaultValue="smtp.gmail.com" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="smtpPort">SMTP Port</Label>
            <Input id="smtpPort" defaultValue="587" />
          </div>
          <Button>Save Email Settings</Button>
        </CardContent>
      </Card>
    </div>
  )
}
EOF

echo "✅ Admin settings page created"

echo ""
echo "========================="
echo "✅ Blog pages created!"
echo ""
echo "Public pages:"
echo "  - /blog (listing)"
echo "  - /blog/[slug] (individual post)"
echo ""
echo "Admin pages:"
echo "  - /admin/blog (management)"
echo "  - /admin/blog/new (create post)"
echo "  - /admin/settings (updated)"
echo ""
echo "Blog system is complete! 📰"
echo "========================="
