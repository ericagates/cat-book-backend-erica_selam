require 'rails_helper'

RSpec.describe "Cats", type: :request do
    it "gets a list of Cats" do
        # Create a new cat in the Test Database (this is not the same one as development)
        Cat.create(firstName: 'Felix', lastName: 'DeCat', age: 2, enjoys: 'Walks in the park')
    
        # Make a request to the API
        get '/cats'
    
        # Convert the response into a Ruby Hash
        json = JSON.parse(response.body)
    
        # Assure that we got a successful response
        expect(response).to have_http_status(:ok)
    
        # Assure that we got one result back as expected
        expect(json.length).to eq 1
    end

    it "creates a cat" do
        # The params we are going to send with the request
        cat_params = {
        cat: {
            firstName: 'Buster',
            lastName: 'Rhymes',
            age: 4,
            enjoys: 'Meow Mix, and plenty of sunshine.'
        }
        }
    
        # Send the request to the server
        post '/cats', params: cat_params
    
        # Assure that we get a success back
        expect(response).to have_http_status(:ok)
    
        # Look up the cat we expect to be created in the Database
        cat = Cat.first
    
        # Assure that the created cat has the correct attributes
        expect(cat.firstName).to eq 'Buster'
    end
# update test
    # it "updates a cat" do
    #     # The params we are going to send with the request
    #     cat_params = {
    #     cat: {
    #         firstName: 'Buster',
    #         lastName: 'Rhymes',
    #         age: 4,
    #         enjoys: 'Meow Mix, and plenty of sunshine.'
    #     }
    #     }
    
    #     # Send the request to the server
    #     put '/cats/:id', params: cat_params
    
    #     # Assure that we get a success back
    #     expect(response).to have_http_status(:ok)
    
    #     # Look up the cat we expect to be created in the Database
    #     cat = Cat.first
    
    #     # Assure that the created cat has the correct attributes
    #     expect(cat.firstName).to eq 'Buster'
    # end

    it "doesn't create a cat without a first name" do
        cat_params = {
        cat: {
            age: 2,
            enjoys: 'Walks in the park'
        }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['firstName']).to include "can't be blank"
    end

    it "doesn't create a cat without a last name" do
        cat_params = {
        cat: {
            age: 2,
            enjoys: 'Walks in the park'
        }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['lastName']).to include "can't be blank"
    end

    it "doesn't create a cat without an age" do
        cat_params = {
        cat: {
            firstName: 'Buster',
            lastName: 'Rhymes',
            enjoys: 'Walks in the park'
        }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['age']).to include "can't be blank"
    end

    it "doesn't create a cat without an enjoys" do
        cat_params = {
        cat: {
            firstName: 'Buster',
            lastName: 'Rhymes',
            age: 4
        }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['enjoys']).to include "can't be blank"
    end

    it "doesn't create a cat without a minimum of 10 characters for enjoys" do
        cat_params = {
        cat: {
            firstName: 'Buster',
            lastName: 'Rhymes',
            enjoys: 'walks',
            age: 4
        }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['enjoys'].length).to be >= 10 
    end

end
