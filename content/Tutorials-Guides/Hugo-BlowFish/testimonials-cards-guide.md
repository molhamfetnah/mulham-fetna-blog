---
title: layouts shortcodes testimonial-gallery

---

## File 1: `layouts/shortcodes/testimonial-gallery.html`
> Click the link to view conversation with Kimi AI Assistant https://www.kimi.com/share/19d6c8e8-f722-8de8-8000-0000469ab17e

```html
{{/* 
  Testimonial Gallery Shortcode - Hugo 0.147+ Compatible
  Images: assets/testimonials/ | Data: data/testimonials.yaml
  Usage: {{< testimonial-gallery course="python-data" >}}
*/}}

{{ $filter := .Get "course" | default "all" }}
{{ $title := .Get "title" | default "Student Testimonials" }}
{{ $testimonials := site.Data.testimonials.testimonials }}

{{/* Filter by course if specified */}}
{{ $filtered := slice }}
{{ if eq $filter "all" }}
  {{ $filtered = $testimonials }}
{{ else }}
  {{ range $testimonials }}
    {{ if eq .course $filter }}
      {{ $filtered = $filtered | append . }}
    {{ end }}
  {{ end }}
{{ end }}

{{ if $filtered }}

<section class="testimonial-gallery-section mb-12" aria-labelledby="testimonial-heading">
  {{ with $title }}
    <h2 id="testimonial-heading" class="text-2xl font-bold mb-6 text-neutral-800 dark:text-neutral-200">
      {{ . }}
    </h2>
  {{ end }}

  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6" role="list">
    {{ range $filtered }}
      <article class="testimonial-card group relative bg-neutral-100 dark:bg-neutral-800 rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-all duration-300 border border-neutral-200 dark:border-neutral-700 flex flex-col" role="listitem">
        
        <div class="block p-6 flex flex-col h-full">
          
          {{/* Image - Attached as is, no grayscale, circular crop */}}
          <div class="flex items-center justify-center mb-4">
            {{ if .image }}
              {{ $imgPath := printf "testimonials/%s" (path.Base .image) }}
              {{ $img := resources.Get $imgPath }}
              
              {{ if $img }}
                {{/* No processing - use original, or resize lightly if needed */}}
                {{ $processed := $img.Resize "200x200 webp q85" }}
                <img src="{{ $processed.RelPermalink }}" 
                     alt="{{ .name }} portrait" 
                     class="w-24 h-24 rounded-full object-cover border-4 border-white dark:border-neutral-700 shadow-md group-hover:scale-105 transition-transform duration-300"
                     loading="lazy"
                     width="96"
                     height="96">
              {{ else }}
                {{ warnf "Testimonial image not found in assets/%s for %s" $imgPath .name }}
                <div class="w-24 h-24 rounded-full bg-gradient-to-br from-primary-400 to-primary-600 flex items-center justify-center text-2xl font-bold text-white shadow-md">
                  {{ substr .name 0 1 }}
                </div>
              {{ end }}
            {{ else }}
              <div class="w-24 h-24 rounded-full bg-gradient-to-br from-primary-400 to-primary-600 flex items-center justify-center text-2xl font-bold text-white shadow-md">
                {{ substr .name 0 1 }}
              </div>
            {{ end }}
          </div>

          {{/* Testimonial Quote - Main Content */}}
          <div class="flex-grow flex flex-col">
            {{/* Quote Icon */}}
            <div class="text-primary-400 mb-2 text-4xl leading-none">"</div>
            
            <blockquote class="text-neutral-700 dark:text-neutral-300 text-sm italic mb-4 flex-grow">
              {{ .testimonial }}
            </blockquote>

            {{/* Mentee Details */}}
            <div class="pt-4 border-t border-neutral-200 dark:border-neutral-700">
              <h3 class="text-base font-bold text-neutral-900 dark:text-neutral-100">
                {{ .name }}
              </h3>
              
              {{ with .details }}
                <p class="text-xs text-neutral-500 dark:text-neutral-400 mt-1">{{ . }}</p>
              {{ end }}
              
              {{ with .course }}
                <div class="flex items-center mt-2 text-xs font-medium text-primary-600 dark:text-primary-400">
                  {{ partial "icon.html" "graduation-cap" }}
                  <span class="ml-1.5">{{ . }}</span>
                </div>
              {{ end }}
              
              {{ with .date }}
                <p class="text-xs text-neutral-400 dark:text-neutral-600 mt-1">{{ . }}</p>
              {{ end }}
            </div>
          </div>
        </div>
      </article>
    {{ end }}
  </div>
</section>

{{/* Schema.org Review markup for SEO */}}
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "{{ $title }}",
  "itemListElement": [
    {{ range $index, $t := $filtered }}
    {
      "@type": "Review",
      "position": {{ add $index 1 }},
      "author": {
        "@type": "Person",
        "name": "{{ $t.name }}"
      },
      "reviewBody": "{{ $t.testimonial }}",
      "itemReviewed": {
        "@type": "Course",
        "name": "{{ $t.course }}"
      }
    }{{ if ne (add $index 1) (len $filtered) }},{{ end }}
    {{ end }}
  ]
}
</script>

{{ else }}
  {{ warnf "No testimonials found for filter: %s" $filter }}
{{ end }}
```

---

## File 2: `data/testimonials.yaml`

```yaml
testimonials:
  - name: "Ahmed Al-Rashid"
    image: "ahmed-portrait.jpg"      # Place in assets/testimonials/
    testimonial: "This course completely transformed my career path. The hands-on projects gave me the confidence to apply for senior data engineering roles. Mulham's mentorship style is unmatched."
    details: "Data Engineer at Aramco"
    course: "Python Data Engineering"
    date: "January 2025"
    
  - name: "Sarah Johnson"
    image: "sarah.jpg"
    testimonial: "From zero Python knowledge to building ML pipelines in 3 months. The curriculum is perfectly structured and the community support is incredible."
    details: "ML Engineer | Former Biologist"
    course: "MLops from Zero to Hero"
    date: "March 2025"
    
  - name: "Mohammed Al-Farsi"
    image: "mohammed.png"
    testimonial: "The robotics module helped me win first place in the national mechatronics competition. Highly recommended for anyone serious about robotics."
    details: "Mechatronics Student | Competition Winner"
    course: "Mechatronics & Robotics 101"
    date: "February 2025"
    
  - name: "Fatima Al-Zahra"
    image: "fatima.jpg"
    testimonial: "I switched careers from accounting to AI development thanks to this bootcamp. The practical approach and real-world projects made all the difference."
    details: "AI Developer at STC"
    course: "Python Data Engineering"
    date: "December 2024"
```

---

## Usage Examples

### Show All Testimonials
```markdown
## What Our Students Say
{{< testimonial-gallery >}}
```

### Filter by Specific Course
```markdown
## Python Course Testimonials
{{< testimonial-gallery course="Python Data Engineering" >}}
```

### With Custom Title
```markdown
## Success Stories
{{< testimonial-gallery title="Graduate Success Stories" course="MLops from Zero to Hero" >}}
```

---

## Directory Structure

```bash
your-blog/
├── assets/
│   ├── org-images/              # Organization logos
│   └── testimonials/            # Student photos (portraits)
│       ├── ahmed-portrait.jpg
│       ├── sarah.jpg
│       ├── mohammed.png
│       └── fatima.jpg
├── data/
│   ├── organizations.yaml       # Your existing org data
│   └── testimonials.yaml        # New testimonials data
└── layouts/
    └── shortcodes/
        ├── org-gallery.html     # Existing org shortcode
        └── testimonial-gallery.html  # New testimonials shortcode
```

---

## Key Differences from Org Gallery

| Feature | Org Gallery | Testimonial Gallery |
|---------|-------------|---------------------|
| **Image Shape** | Rectangle (aspect ratio preserved) | Circular (`rounded-full`) |
| **Image Effect** | Grayscale → Color on hover | Color always, scale on hover |
| **Main Text** | Organization description | Testimonial quote (italic) |
| **Secondary** | Location with map icon | Name + role |
| **Tertiary** | Website link | Course name with graduation cap icon |
| **Schema Type** | Organization | Review |
| **External Link** | Yes (to website) | No (static card) |

Both use the same **responsive grid** (2 columns → 3 columns) and **card styling**, so they visually match on the page!

Want me to add a **rating stars** feature or **LinkedIn profile links** to the testimonials?