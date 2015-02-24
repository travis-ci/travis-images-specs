require 'spec_helper'

describe 'maven installation' do
  describe command('mvm version') do
    its(:stdout) { should match 'Apache Maven 3.2.5' }
  end

  describe 'mvm commands are executed' do

    before do
      system('mvn archetype:generate 
              -DgroupId=com.test.app 
              -DartifactId=test-app 
              -DarchetypeArtifactId=maven-archetype-quickstart 
              -DinteractiveMode=false; 
               sleep 25')
    end

    describe command('cd test-app; mvn package; sleep 15') do
      its(:stdout) { should include ( 'Building my-app 1.0-SNAPSHOT','BUILD SUCCESS')}
    end

    describe command('cd test-app; java -cp target/test-app-1.0-SNAPSHOT.jar com.test.app.App') do
      its(:stdout) { should match 'Hello World!'}
    end
  end
end
