describe Spree::Unifaun::ShipmentHandler do

  subject { described_class.new create(:shipment) }

  context '.post' do
    it 'notifies Unifaun of a new Spree::Shipment' do
    end
  end

  context '.status' do
    it 'gets the status of a Spree::Shipment from Unifaun' do
    end
  end

  describe '.to_xml' do

    it 'has root element with the encoding ISO-8859-1' do
      expect(subject.to_xml).to match(/encoding=\"ISO-8859-1\"/)
    end

    context '<receiver> element:' do

      it 'is present' do
        expect(subject.to_xml).to have_xml '/data/receiver'
      end

      it 'has the address\'s id as rcvid' do
        address_id = subject.address.id
        expect(subject.to_xml).to have_xml "/data/receiver[@rcvid=#{address_id}]"
      end

      it 'has name as Unifaun AB' do
        subject.address.firstname = 'Unifaun'
        subject.address.lastname = 'AB'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="name"]', 'Unifaun AB'
      end

      it 'has address1 as 5, 7th avenue' do
        subject.address.address1 = '5, 7th avenue'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="address1"]', '5, 7th avenue'
      end

      it 'has address2 as Kaserntorget' do
        subject.address.address2 = 'Kaserntorget'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="address2"]', 'Kaserntorget'
      end

      it 'has zipcode as 97469' do
        subject.address.zipcode = '97469'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="zipcode"]', '97469'
      end

      it 'has city as BERLIN' do
        subject.address.city = 'BERLIN'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="city"]', 'BERLIN'
      end

      it 'has country as DE' do
        subject.address.country.iso_name = 'DE'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="country"]', 'DE'
      end

      it 'has email as support@unifaun.se' do
        subject.order.user.email = 'support@unifaun.se'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="email"]', 'support@unifaun.se'
      end

      it 'has phone as 031-725 35 00' do
        subject.address.phone = '031-725 35 00'
        expect(subject.to_xml).to have_xml '/data/receiver/val[@n="phone"]', '031-725 35 00'
      end
    end

    describe '<shipment> element: ' do

      it 'is present' do
        expect(subject.to_xml).to have_xml '/data/shipment'
      end

      it "has the order's number as orderno" do
        order_no = subject.order.number
        expect(subject.to_xml).to have_xml "/data/shipment[@orderno=\"#{order_no}\"]"
      end

      it 'has *from* as 123 - the sender\'s quick id' do
        Spree::Unifaun::Config.preferred_quick_id_for_sender = 123
        expect(subject.to_xml).to have_xml '/data/shipment/val[@n="from"]', '123'
      end

      it 'has *to* as the ship-address id' do
        expect(subject.to_xml).to have_xml '/data/shipment/val[@n="to"]', subject.address.id.to_s
      end

      it 'has *shipdate* as 2013-07-01 when the shipments is created-at 2013-07-01' do
        subject.shipment.created_at = DateTime.parse('2013-07-01')
        expect(subject.to_xml).to have_xml '/data/shipment/val[@n="shipdate"]', '2013-07-01'
      end

      context '<service> element:' do
        it 'is present' do
          expect(subject.to_xml).to have_xml '/data/shipment/service'
        end

        it 'has the "srvid" as APL when chosen service is APL' do
          Spree::Unifaun::Config.preferred_service = 'APL'
          expect(subject.to_xml).to have_xml '/data/shipment/service[@srvid="APL"]'
        end
      end

      context '<container> element:' do

        it 'is present' do
          expect(subject.to_xml).to have_xml '/data/shipment/container'
        end

        it 'has the "type" as "parcel"' do
          expect(subject.to_xml).to have_xml '/data/shipment/container[@type="parcel"]'
        end

        it 'has copies as 1 when there is one parcel in the package' do
          expect(subject.to_xml).to have_xml '/data/shipment/container/val[@n="copies"]', '1'
        end

        it 'has weight as 5 when there are two items in the order of weight 2kg and 3kg' do
          order = create(:order)
          variant_one = create(:base_variant, weight: 2)
          variant_two = create(:base_variant, weight: 3)
          create(:line_item, quantity: 1, variant: variant_one, order: order)
          create(:line_item, quantity: 1, variant: variant_two, order: order)
          order.line_items.reload
          subject = described_class.new create(:shipment, order: order)
          expect(subject.to_xml).to have_xml '/data/shipment/container/val[@n="weight"]', '5.0'
        end
      end
    end
  end
end
