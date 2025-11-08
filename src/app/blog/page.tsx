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
    date: '2025-11-05',
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
    date: '2025-11-03',
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
    date: '2025-11-01',
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
    date: '2025-10-28',
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
    date: '2025-10-25',
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
    date: '2025-10-22',
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
