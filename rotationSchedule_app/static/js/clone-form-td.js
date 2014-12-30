/*
Author: Tristan Denyer (based on Charlie Griefer's original clone code, and some great help from Dan - see his comments in blog post)
Plugin repo: https://github.com/tristandenyer/Clone-section-of-form-using-jQuery
Demo at http://tristandenyer.com/using-jquery-to-duplicate-a-section-of-a-form-maintaining-accessibility/
Ver: 0.9.4.1
Last updated: Sep 24, 2014

The MIT License (MIT)

Copyright (c) 2011 Tristan Denyer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
$(function () {
    $('#btnAdd').click(function () {
        var num     = $('.clonedInput').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#entry' + num).clone().attr('id', 'entry' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value
    
    /*  This is where we manipulate the name/id values of the input inside the new, cloned element
        Below are examples of what forms elements you can clone, but not the only ones.
        There are 2 basic structures below: one for an H2, and one for form elements.
        To make more, you can copy the one for form elements and simply update the classes for its label and input.
        Keep in mind that the .val() method is what clears the element when it gets cloned. Radio and checkboxes need .val([]) instead of .val('').
    */
        // H2 - section
        newElem.find('.heading-reference').attr('id', 'ID' + newNum + '_reference').attr('name', 'ID' + newNum + '_reference').html('Entry #' + newNum);

        // Title - select
        newElem.find('.label_ttl').attr('for', 'ID' + newNum + '_title');
        newElem.find('.select_ttl').attr('id', 'ID' + newNum + '_title').attr('name', 'ID' + newNum + '_title').val('');

        // Block name - text
        newElem.find('.label_bn').attr('for', 'ID' + newNum + '_block_name');
        newElem.find('.input_bn').attr('id', 'ID' + newNum + '_block_name').attr('name', 'ID' + newNum + '_block_name').val('');


        // Block name - text
        newElem.find('.label_bl').attr('for', 'ID' + newNum + '_block_name');
        newElem.find('.input_bl').attr('id', 'ID' + newNum + '_block_length').attr('name', 'ID' + newNum + '_block_length').val('');

        /* Year - text
        newElem.find('.label_year').attr('for', 'ID' + newNum + '_first_name');
        newElem.find('.input_year').attr('id', 'ID' + newNum + '_first_name').attr('name', 'ID' + newNum + '_first_name').val('');*/

        /* Last name - text
        newElem.find('.label_ln').attr('for', 'ID' + newNum + '_last_name');
        newElem.find('.input_ln').attr('id', 'ID' + newNum + '_last_name').attr('name', 'ID' + newNum + '_last_name').val('');*/

        // Color - checkbox
        newElem.find('.label_checkboxitem').attr('for', 'ID' + newNum + '_checkboxitem');
        newElem.find('.input_checkboxitem').attr('id', 'ID' + newNum + '_checkboxitem').attr('name', 'ID' + newNum + '_checkboxitem').val([]);

        // Weeks or Months for block length - radio
        newElem.find('.label_radio').attr('for', 'ID' + newNum + '_radioitem');
        newElem.find('.input_radio').attr('id', 'ID' + newNum + '_radioitem').attr('name', 'ID' + newNum + '_radioitem').val([]);

        // Email - text
        newElem.find('.label_email').attr('for', 'ID' + newNum + '_email_address');
        newElem.find('.input_email').attr('id', 'ID' + newNum + '_email_address').attr('name', 'ID' + newNum + '_email_address').val('');

        // Twitter handle (for Bootstrap demo) - append and text
        newElem.find('.label_twt').attr('for', 'ID' + newNum + '_twitter_handle');
        newElem.find('.input_twt').attr('id', 'ID' + newNum + '_twitter_handle').attr('name', 'ID' + newNum + '_twitter_handle').val('');

    // Insert the new element after the last "duplicatable" input field
        $('#entry' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();

    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDel').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAdd').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });

    $('#btnDel').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedInput').length;
                // how many "duplicatable" input fields we currently have
                $('#entry' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDel').attr('disabled', true);
                // enable the "add" button
                $('#btnAdd').attr('disabled', false).prop('value', "add block");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAdd').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDel').attr('disabled', true);



    $('#btnAddRotation').click(function () {
        var num     = $('.clonedRotation').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#rotation' + num).clone().attr('id', 'rotation' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value

        // H4 - section
        newElem.find('.heading-reference').attr('id', 'ID' + newNum + '_reference').attr('name', 'ID' + newNum + '_reference').html('Rotation #' + newNum);

        //rotation name
        newElem.find('.label_rn').attr('for', 'ID' + newNum + '_rotation_name');
        newElem.find('.input_rn').attr('id', 'ID' + newNum + '_rotation_name').attr('name', 'ID' + newNum + '_rotation_name').val('');

        //"easy" radio
        newElem.find('.label_easy').attr('for', 'ID' + newNum + '_radio_easy');
        newElem.find('.input_easy').attr('id', 'ID' + newNum + '_radio_easy').attr('name', 'ID' + newNum + '_radio_easy').val('');

        //"medium" radio
        newElem.find('.label_medium').attr('for', 'ID' + newNum + '_radio_medium');
        newElem.find('.input_medium').attr('id', 'ID' + newNum + '_radio_medium').attr('name', 'ID' + newNum + '_radio_medium').val('');

        //"hard" radio
        newElem.find('.label_hard').attr('for', 'ID' + newNum + '_radio_hard');
        newElem.find('.input_hard').attr('id', 'ID' + newNum + '_radio_hard').attr('name', 'ID' + newNum + '_radio_hard').val('');

        //min residents
        newElem.find('.label_min_res').attr('for', 'ID' + newNum + '_min_res');
        newElem.find('.input_min_res').attr('id', 'ID' + newNum + '_min_res').attr('name', 'ID' + newNum + '_min_res').val('');

        //max residents
        newElem.find('.label_max_res').attr('for', 'ID' + newNum + '_max_res');
        newElem.find('.input_max_res').attr('id', 'ID' + newNum + '_max_res').attr('name', 'ID' + newNum + '_max_res').val('');

        //newElem.find('.label_checkboxitem').attr('for', 'ID' + newNum + '_checkboxitem');
        newElem.find('.input_checkboxitem').attr('id', 'ID' + newNum + '_checkboxitem').attr('name', 'ID' + newNum + '_checkboxitem').val([]);

        // Insert the new element after the last "duplicatable" input field
        $('#rotation' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();

    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDelRotation').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAddRotation').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });


    $('#btnDelRotation').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedRotation').length;
                // how many "duplicatable" input fields we currently have
                $('#rotation' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDelRotation').attr('disabled', true);
                // enable the "add" button
                $('#btnAddRotation').attr('disabled', false).prop('value', "add rotation");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAddRotation').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDelRotation').attr('disabled', true);


    $('#btnAddYear').click(function () {
        var num     = $('.clonedYear').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#year' + num).clone().attr('id', 'year' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value

        
        //rotation name
        newElem.find('.label_yn').attr('for', 'ID' + newNum + '_year_name');
        newElem.find('.input_yn').attr('id', 'ID' + newNum + '_year_name').attr('name', 'ID' + newNum + '_year_name').val('');

        // Insert the new element after the last "duplicatable" input field
        $('#year' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();

    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDelYear').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAddYear').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });


    $('#btnDelYear').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedYear').length;
                // how many "duplicatable" input fields we currently have
                $('#year' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDelYear').attr('disabled', true);
                // enable the "add" button
                $('#btnAddYear').attr('disabled', false).prop('value', "add section");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAddYear').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDelYear').attr('disabled', true);



    $('#btnAddResident').click(function () {
        var num     = $('.clonedResident').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#resident' + num).clone().attr('id', 'resident' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value

        //resident name
        newElem.find('.label_dn').attr('for', 'ID' + newNum + '_resident_name');
        newElem.find('.input_dn').attr('id', 'ID' + newNum + '_resident_name').attr('name', 'ID' + newNum + '_resident_name').val('');


        //resident email
        newElem.find('.label_de').attr('for', 'ID' + newNum + '_resident_email');
        newElem.find('.input_de').attr('id', 'ID' + newNum + '_resident_email').attr('name', 'ID' + newNum + '_resident_email').val('');

        //resident year/track
        newElem.find('.label_ys').attr('for', 'ID' + newNum + '_res_year_select');
        newElem.find('.select_year').attr('id', 'ID' + newNum + '_res_year_select');
        
        //newElem.removeClass("chzn-done").removeAttr("id").css("display", "block").next().remove();
        //$(".chsn").chosen();

        // Insert the new element after the last "duplicatable" input field
        $('#resident' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();


    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDelResident').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAddResident').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });


    $('#btnDelResident').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedResident').length;
                // how many "duplicatable" input fields we currently have
                $('#resident' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDelResident').attr('disabled', true);
                // enable the "add" button
                $('#btnAddResident').attr('disabled', false).prop('value', "add resident");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAddResident').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDelResident').attr('disabled', true);


    $('#btnAddRotationBlock').click(function () {
        var num     = $('.clonedRotationBlock').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#rotationBlock' + num).clone().attr('id', 'rotationBlock' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value

        
        //block select
        //newElem.find('.label_bs').attr('for', 'ID' + newNum + '_block_select');
        //newElem.find('.select_block').attr('id', 'ID' + newNum + '_block_select').attr('name', 'ID' + newNum + '_block_select').val('');


        //rotation select
        //newElem.find('.label_rs').attr('for', 'ID' + newNum + '_rotation_select');
        //newElem.find('.select_rotation').attr('id', 'ID' + newNum + '_rotation_select').attr('name', 'ID' + newNum + '_rotation_select').val('');

        // H4 - section
        newElem.find('.heading-reference').attr('id', 'ID' + newNum + '_rotationBlockEntry').attr('name', 'ID' + newNum + '_rotationBlockEntry').html('Entry #' + newNum);


        //min select
        newElem.find('.label_max').attr('for', 'ID' + newNum + '_max_length');
        newElem.find('.input_max').attr('id', 'ID' + newNum + '_max_length').attr('name', 'ID' + newNum + '_max_length').val('');

        //max select
        newElem.find('.label_min').attr('for', 'ID' + newNum + '_min_length');
        newElem.find('.input_min').attr('id', 'ID' + newNum + '_min_length').attr('name', 'ID' + newNum + '_min_length').val('');

        // Insert the new element after the last "duplicatable" input field
        $('#rotationBlock' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();

    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDelRotationBlock').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAddRotationBlock').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });


    $('#btnDelRotationBlock').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedRotationBlock').length;
                // how many "duplicatable" input fields we currently have
                $('#rotationBlock' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDelRotationBlock').attr('disabled', true);
                // enable the "add" button
                $('#btnAddRotationBlock').attr('disabled', false).prop('value', "add section");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAddRotationBlock').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDelRotationBlock').attr('disabled', true);


    $('#btnAddRotationYear').click(function () {
        var num     = $('.clonedRotationYear').length, // Checks to see how many "duplicatable" input fields we currently have
            newNum  = new Number(num + 1),      // The numeric ID of the new input field being added, increasing by 1 each time
            newElem = $('#rotationYear' + num).clone().attr('id', 'rotationYear' + newNum).fadeIn('slow'); // create the new element via clone(), and manipulate it's ID using newNum value

        
        //year select
        //newElem.find('.label_ys').attr('for', 'ID' + newNum + '_year_select');
        //newElem.find('.select_year').attr('id', 'ID' + newNum + '_year_select').attr('name', 'ID' + newNum + '_year_select').val('');


        //rotation select
        //newElem.find('.label_rys').attr('for', 'ID' + newNum + '_rotationYear_select');
        //newElem.find('.select_rotationYear').attr('id', 'ID' + newNum + '_rotationYear_select').attr('name', 'ID' + newNum + '_rotationYear_select').val('');

        // H4 - section
        newElem.find('.heading-reference').attr('id', 'ID' + newNum + '_rotationYearEntry').attr('name', 'ID' + newNum + '_rotationYearEntry').html('Entry #' + newNum);


        //min select
        newElem.find('.label_max_year').attr('for', 'ID' + newNum + '_max_year_length');
        newElem.find('.input_max_year').attr('id', 'ID' + newNum + '_max_year_length').attr('name', 'ID' + newNum + '_max_year_length').val('');

        //max select
        newElem.find('.label_min_year').attr('for', 'ID' + newNum + '_min_year_length');
        newElem.find('.input_min_year').attr('id', 'ID' + newNum + '_min_year_length').attr('name', 'ID' + newNum + '_min_year_length').val('');

        // Insert the new element after the last "duplicatable" input field
        $('#rotationYear' + num).after(newElem);
        $('#ID' + newNum + '_title').focus();

    // Enable the "remove" button. This only shows once you have a duplicated section.
        $('#btnDelRotationYear').attr('disabled', false);

    // Right now you can only add 4 sections, for a total of 5. Change '5' below to the max number of sections you want to allow.
        if (newNum == 20)
        $('#btnAddRotationYear').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
    });


    $('#btnDelRotationYear').click(function () {
    // Confirmation dialog box. Works on all desktop browsers and iPhone.
        if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
            {
                var num = $('.clonedRotationYear').length;
                // how many "duplicatable" input fields we currently have
                $('#rotationYear' + num).slideUp('slow', function () {$(this).remove();
                // if only one element remains, disable the "remove" button
                    if (num -1 === 1)
                $('#btnDelRotationYear').attr('disabled', true);
                // enable the "add" button
                $('#btnAddRotationYear').attr('disabled', false).prop('value', "add section");});
            }
        return false; // Removes the last section you added
    });
    // Enable the "add" button
    $('#btnAddRotationYear').attr('disabled', false);
    // Disable the "remove" button
    $('#btnDelRotationYear').attr('disabled', true);

});