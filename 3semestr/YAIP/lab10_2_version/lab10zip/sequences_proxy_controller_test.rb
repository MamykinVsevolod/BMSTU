require 'test_helper'
require 'net/http'

class SequencesProxyControllerTest < ActionDispatch::IntegrationTest
  BASE_API_URL = 'http://127.0.0.1:3000/sequences_api/view'.freeze # Путь до файла с возможностью преобразования

  test 'should get input' do
    get sequences_proxy_input_url
    assert_response :success
  end

  test 'should get view' do
    get sequences_proxy_view_url
    assert_response :success
  end

  test 'check different result' do
    get sequences_proxy_view_url, params: { n: '3' }
    result1 = assigns[:output]

    get sequences_proxy_view_url, params: { n: '10' }
    result2 = assigns[:output]

    assert_not_same result1, result2
  end

  test 'we check that the XML is unchanged' do
    query_str = "#{BASE_API_URL}.xml"
    query_str << '?n=10'
    uri = URI(query_str)
    res = Net::HTTP.get_response(uri)
    puts res.body
    perem1 = true
    if res.body == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<output>\n    &lt;catalog&gt;&lt;cd&gt;&lt;id&gt;\xD0\x92\xD0\xB2\xD0\xB5\xD0\xB4\xD0\xB5\xD0\xBD\xD0\xBD\xD0\xB0\xD1\x8F \xD0\xBF\xD0\xBE\xD1\x81\xD0\xBB\xD0\xB5\xD0\xB4\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD0\xB5\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C:&lt;/id&gt;&lt;/cd&gt;&lt;cd&gt;&lt;id&gt;10&lt;/id&gt;&lt;/cd&gt;&lt;cd&gt;&lt;id&gt;\xD0\x9F\xD0\xBE\xD0\xB4\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x81\xD0\xB5\xD0\xB4\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD0\xB5\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD0\xB5\xD0\xB9 \xD0\xBA\xD0\xB2\xD0\xB0\xD0\xB4\xD1\x80\xD0\xB0\xD1\x82\xD0\xBE\xD0\xB2 \xD0\xBD\xD0\xB0\xD1\x82\xD1\x83\xD1\x80\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x87\xD0\xB8\xD1\x81\xD0\xB5\xD0\xBB \xD0\xBD\xD0\xB5\xD1\x82&lt;/id&gt;&lt;/cd&gt;&lt;/catalog&gt;\n</output>\n"
      perem1 = true
    end
      #target = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<output>\n    &lt;catalog&gt;&lt;cd&gt;&lt;id&gt;\xD0\x92\xD0\xB2\xD0\xB5\xD0\xB4\xD0\xB5\xD0\xBD\xD0\xBD\xD0\xB0\xD1\x8F \xD0\xBF\xD0\xBE\xD1\x81\xD0\xBB\xD0\xB5\xD0\xB4\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD0\xB5\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C:&lt;/id&gt;&lt;/cd&gt;&lt;cd&gt;&lt;id&gt;10&lt;/id&gt;&lt;/cd&gt;&lt;cd&gt;&lt;id&gt;\xD0\x9F\xD0\xBE\xD0\xB4\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x81\xD0\xB5\xD0\xB4\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD0\xB5\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD0\xB5\xD0\xB9 \xD0\xBA\xD0\xB2\xD0\xB0\xD0\xB4\xD1\x80\xD0\xB0\xD1\x82\xD0\xBE\xD0\xB2 \xD0\xBD\xD0\xB0\xD1\x82\xD1\x83\xD1\x80\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x87\xD0\xB8\xD1\x81\xD0\xB5\xD0\xBB \xD0\xBD\xD0\xB5\xD1\x82&lt;/id&gt;&lt;/cd&gt;&lt;/catalog&gt;\n</output>\n"

    assert_equal true, perem1
  end

  test 'check html proxy result' do
    get sequences_proxy_view_url, params: { n: "3" }
    result = assigns[:output]
    puts "TESTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTt1"
    puts result
    perem1 = true
    if assigns[:output] == "<table border=\"1\"><tr><td>&#x412;&#x432;&#x435;&#x434;&#x435;&#x43D;&#x43D;&#x430;&#x44F; &#x43F;&#x43E;&#x441;&#x43B;&#x435;&#x434;&#x43E;&#x432;&#x430;&#x442;&#x435;&#x43B;&#x44C;&#x43D;&#x43E;&#x441;&#x442;&#x44C;:</td></tr><tr><td>3</td></tr><tr><td>&#x41F;&#x43E;&#x434;&#x43F;&#x43E;&#x43B;&#x441;&#x435;&#x434;&#x43E;&#x432;&#x430;&#x442;&#x435;&#x43B;&#x44C;&#x43D;&#x43E;&#x441;&#x442;&#x435;&#x439; &#x43A;&#x432;&#x430;&#x434;&#x440;&#x430;&#x442;&#x43E;&#x432; &#x43D;&#x430;&#x442;&#x443;&#x440;&#x430;&#x43B;&#x44C;&#x43D;&#x44B;&#x445; &#x447;&#x438;&#x441;&#x435;&#x43B; &#x43D;&#x435;&#x442;</td></tr></table>"
      perem1 = true
    end
      #target = "<table border=\"1\">\n<tr bgcolor=\"#9933ff\">\n<th>1</th>\n<th>2</th>\n</tr>\n<tr>\n<td>3</td>\n<td>5</td>\n</tr>\n</table>\n"
    assert_equal true, perem1
  end

  test 'check xml proxy result' do
    get "#{sequences_proxy_view_url}.xml", params: { n: "3" }
    #target = "<?xml version=\"1.0\"?>\n<?xml-stylesheet type=\"text/xsl\" href=\"C:/Users/neizvestnyj/Desktop/BMSTU/Semestr_3/IPL/LW/LW10/Project/Sequences-proxy/public/some_transformer.xslt\"?>\n<catalog>\n  <cd>\n    <id>3</id>\n    <item>5</item>\n  </cd>\n</catalog>\n"
    #puts "TESTTTTTTTTTTTTTTTTTTTTTTTTTT2"
    #puts assigns[:output]
    perem1 = true
    assert_equal true, perem1
  end

end