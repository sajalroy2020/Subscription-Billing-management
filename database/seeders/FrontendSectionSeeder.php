<?php

namespace Database\Seeders;

use App\Models\FrontendSection;
use Illuminate\Database\Seeder;
use phpDocumentor\Reflection\Types\Null_;

class FrontendSectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        FrontendSection::insert([
            ['name' => 'Hero Banner', 'page_title' => 'Banner page title', 'title' => 'Subscription & Billing management software.', 'slug' => 'hero_banner', 'has_page_title' => STATUS_PENDING, 'has_banner_image' => STATUS_ACTIVE, 'has_description' => STATUS_ACTIVE, 'has_image' => STATUS_ACTIVE, 'description' => 'Welcome to the future of revenue management! Our subscription billing software is here to transform the way you handle billing and drive your future business to new heights.', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Core Features', 'page_title' => 'Core Features', 'title' => 'Feature Fusion: Your All-in-One Solution', 'slug' => 'core_features', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_PENDING, 'has_image' => STATUS_PENDING, 'description' => 'Welcome to the future of revenue management! Our subscription billing software is here to transform the way you handle billing and drive your future business to new heights.', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Best Features', 'page_title' => 'Best Features', 'title' => 'features that you will get after getting started.', 'slug' => 'best_features', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_ACTIVE, 'has_image' => STATUS_PENDING, 'description' => 'Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque . Ante in nibh mauris cursus mattis molestie. Sagittis vitae et leo duis ut. Lobortis scelerisque fermentum.', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Pricing Plan', 'page_title' => 'Pricing Plan', 'title' => "Pick the plan that's right for your business.", 'slug' => 'pricing_plan', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_PENDING, 'has_image' => STATUS_PENDING, 'description' => 'Welcome to the future of revenue management! Our subscription billing software is here to transform the way you handle billing and drive your future business to new heights.', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Product Services', 'page_title' => 'Product Services', 'title' => "Collect Payments for Your Products and Services.", 'slug' => 'product_services', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_PENDING, 'has_image' => STATUS_ACTIVE, 'description' => 'Welcome to the future of revenue management! Our subscription billing software is here to transform the way you handle billing and drive your future business to new heights.', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Integrations Menu', 'page_title' => 'Integrations', 'title' => 'make Seamless Integration with some of best apps.', 'slug' => 'integrations_menu', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_ACTIVE, 'has_image' => STATUS_ACTIVE, 'description' => 'Odio euismod lacinia at quis risu sed. Etiam erat velit sceleris que in. Blandit turpis cursu in hac. Porttitor rhoncus dolor purus non enim praesent elementum. ', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Testimonials Area', 'page_title' => 'Testimonials', 'title' => 'What Our Clients have Saying About Us.', 'slug' => 'testimonials_area', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_ACTIVE, 'has_image' => STATUS_PENDING, 'description' => 'Euismod lacinia at quis risu sed. Etiam erat velit sceleris que in. Blandit turpis in hac. Porttitor rhoncus dolor purus enim praesent elementum. ', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()],
            ['name' => "Faq's Area", 'page_title' => "FAQ'S", 'title' => 'Most common question about saas services.', 'slug' => 'faqs_area', 'has_page_title' => STATUS_ACTIVE, 'has_banner_image' => STATUS_PENDING, 'has_description' => STATUS_ACTIVE, 'has_image' => STATUS_PENDING, 'description' => 'Euismod lacinia at quis risu sed. Etiam erat velit sceleris que in. Blandit turpis in hac. Porttitor rhoncus dolor purus enim praesent elementum. ', 'image' => NULL, 'status' => STATUS_ACTIVE, 'banner_image' => NULL, 'created_at' => now(), 'updated_at' => now()]
        ]);
    }
}
