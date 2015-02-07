# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Slides" do
    describe "Admin" do
      describe "slides" do
        login_refinery_user

        describe "slides list" do
          before(:each) do
            FactoryGirl.create(:slide, :title => "UniqueTitleOne")
            FactoryGirl.create(:slide, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.slides_admin_slides_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.slides_admin_slides_path

            click_link "Add New Slide"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Slides::Slide.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Slides::Slide.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:slide, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.slides_admin_slides_path

              click_link "Add New Slide"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Slides::Slide.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:slide, :title => "A title") }

          it "should succeed" do
            visit refinery.slides_admin_slides_path

            within ".actions" do
              click_link "Edit this slide"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:slide, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.slides_admin_slides_path

            click_link "Remove this slide forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Slides::Slide.count.should == 0
          end
        end

      end
    end
  end
end
