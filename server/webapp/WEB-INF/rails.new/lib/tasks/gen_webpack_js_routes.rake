##########################################################################
# Copyright 2017 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

task generated_js: :environment do
  raise 'OUTPUT_DIR not set' if ENV['OUTPUT_DIR'].blank?

  rm_rf ENV['OUTPUT_DIR']
  mkdir_p ENV['OUTPUT_DIR']

  open(Rails.root.join("#{ENV['OUTPUT_DIR']}/js-routes.js"), 'w') do |f|
    f.puts("// This file is automatically generated by `assets_json` task. Any changes will be lost")
    JsRoutes.assert_usable_configuration!
    f.puts JsRoutes.generate
  end
end
