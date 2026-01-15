import React, { useState, useEffect } from 'react';
import {
  Card,
  Table,
  Button,
  Input,
  Tag,
  Space,
  message,
  Modal,
  Descriptions,
  Empty,
  Spin,
  Typography,
  Alert,
  Badge,
  Tooltip
} from 'antd';
import {
  SearchOutlined,
  ShopOutlined,
  LinkOutlined,
  CheckCircleOutlined,
  ClockCircleOutlined,
  CloseCircleOutlined,
  SendOutlined,
  EyeOutlined,
  EnvironmentOutlined,
  PhoneOutlined
} from '@ant-design/icons';
import api from '../../services/apiService';

const { Title, Text } = Typography;
const { TextArea } = Input;

interface Retailer {
  id: number;
  shopName: string;
  address: string;
  phone: string;
  email: string;
  isVerified: boolean;
  productCount: number;
  customerCount: number;
  isLinked: boolean;
  requestStatus: string | null;
}

interface LinkRequest {
  id: number;
  retailerId: number;
  retailerName: string;
  retailerPhone: string;
  retailerAddress: string;
  status: string;
  message: string;
  rejectionReason: string | null;
  createdAt: string;
  respondedAt: string | null;
}

const RetailerDiscoveryPage: React.FC = () => {
  const [retailers, setRetailers] = useState<Retailer[]>([]);
  const [myRequests, setMyRequests] = useState<LinkRequest[]>([]);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState('');
  const [currentLinkedId, setCurrentLinkedId] = useState<number | null>(null);
  const [selectedRetailer, setSelectedRetailer] = useState<Retailer | null>(null);
  const [requestMessage, setRequestMessage] = useState('');
  const [requestModalVisible, setRequestModalVisible] = useState(false);
  const [viewModalVisible, setViewModalVisible] = useState(false);
  const [sendingRequest, setSendingRequest] = useState(false);

  useEffect(() => {
    fetchRetailers();
    fetchMyRequests();
  }, [search]);

  const fetchRetailers = async () => {
    setLoading(true);
    try {
      const response = await api.get('/store/retailers/available', {
        params: { search }
      });
      setRetailers(response.data.retailers || []);
      setCurrentLinkedId(response.data.currentLinkedRetailerId || null);
    } catch (error: any) {
      message.error('Failed to fetch retailers');
    } finally {
      setLoading(false);
    }
  };

  const fetchMyRequests = async () => {
    try {
      const response = await api.get('/store/retailers/link-requests');
      setMyRequests(response.data.requests || []);
    } catch (error: any) {
      console.error('Failed to fetch requests:', error);
    }
  };

  const handleSendRequest = async () => {
    if (!selectedRetailer) return;

    setSendingRequest(true);
    try {
      await api.post('/store/retailers/link-request', {
        retailerId: selectedRetailer.id,
        message: requestMessage
      });
      message.success('Link request sent successfully!');
      setRequestModalVisible(false);
      setRequestMessage('');
      setSelectedRetailer(null);
      fetchRetailers();
      fetchMyRequests();
    } catch (error: any) {
      message.error(error.response?.data?.error || 'Failed to send request');
    } finally {
      setSendingRequest(false);
    }
  };

  const handleCancelRequest = async (requestId: number) => {
    try {
      await api.delete(`/store/retailers/link-request/${requestId}`);
      message.success('Request cancelled');
      fetchRetailers();
      fetchMyRequests();
    } catch (error: any) {
      message.error('Failed to cancel request');
    }
  };

  const getStatusTag = (retailer: Retailer) => {
    if (retailer.isLinked) {
      return <Tag color="green" icon={<CheckCircleOutlined />}>Linked</Tag>;
    }
    if (retailer.requestStatus === 'pending') {
      return <Tag color="orange" icon={<ClockCircleOutlined />}>Request Pending</Tag>;
    }
    if (retailer.requestStatus === 'approved') {
      return <Tag color="green" icon={<CheckCircleOutlined />}>Approved</Tag>;
    }
    if (retailer.requestStatus === 'rejected') {
      return <Tag color="red" icon={<CloseCircleOutlined />}>Rejected</Tag>;
    }
    return <Tag color="default">Not Linked</Tag>;
  };

  const columns = [
    {
      title: 'Retailer',
      key: 'retailer',
      render: (_: any, record: Retailer) => (
        <Space direction="vertical" size={0}>
          <Space>
            <ShopOutlined />
            <Text strong>{record.shopName}</Text>
            {record.isVerified && (
              <Tooltip title="Verified Retailer">
                <CheckCircleOutlined style={{ color: '#52c41a' }} />
              </Tooltip>
            )}
          </Space>
          <Text type="secondary" style={{ fontSize: 12 }}>
            <EnvironmentOutlined /> {record.address || 'No address'}
          </Text>
        </Space>
      ),
    },
    {
      title: 'Contact',
      key: 'contact',
      render: (_: any, record: Retailer) => (
        <Space direction="vertical" size={0}>
          <Text type="secondary" style={{ fontSize: 12 }}>
            <PhoneOutlined /> {record.phone || 'N/A'}
          </Text>
        </Space>
      ),
    },
    {
      title: 'Products',
      dataIndex: 'productCount',
      key: 'productCount',
      align: 'center' as const,
      render: (count: number) => (
        <Badge count={count} showZero style={{ backgroundColor: count > 0 ? '#52c41a' : '#d9d9d9' }} />
      ),
    },
    {
      title: 'Status',
      key: 'status',
      render: (_: any, record: Retailer) => getStatusTag(record),
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (_: any, record: Retailer) => (
        <Space>
          <Button
            icon={<EyeOutlined />}
            size="small"
            onClick={() => {
              setSelectedRetailer(record);
              setViewModalVisible(true);
            }}
          >
            View
          </Button>
          {!record.isLinked && !currentLinkedId && record.requestStatus !== 'pending' && (
            <Button
              type="primary"
              icon={<SendOutlined />}
              size="small"
              onClick={() => {
                setSelectedRetailer(record);
                setRequestModalVisible(true);
              }}
            >
              {record.requestStatus === 'rejected' ? 'Resend Request' : 'Send Request'}
            </Button>
          )}
          {record.requestStatus === 'pending' && (
            <Button
              danger
              size="small"
              onClick={() => {
                const req = myRequests.find(r => r.retailerId === record.id && r.status === 'pending');
                if (req) handleCancelRequest(req.id);
              }}
            >
              Cancel
            </Button>
          )}
        </Space>
      ),
    },
  ];

  return (
    <div style={{ padding: 24 }}>
      <Title level={3}>
        <LinkOutlined /> Discover Retailers
      </Title>

      {currentLinkedId && (
        <Alert
          message="You are already linked to a retailer"
          description="You can only be linked to one retailer at a time. To change your retailer, please contact support."
          type="info"
          showIcon
          style={{ marginBottom: 16 }}
        />
      )}

      {!currentLinkedId && myRequests.filter(r => r.status === 'pending').length === 0 && (
        <Alert
          message="Link to a Retailer"
          description="You need to send a link request to a retailer and wait for approval before you can view products and place orders."
          type="warning"
          showIcon
          style={{ marginBottom: 16 }}
        />
      )}

      {myRequests.filter(r => r.status === 'pending').length > 0 && (
        <Card title="Pending Requests" size="small" style={{ marginBottom: 16 }}>
          <Space direction="vertical" style={{ width: '100%' }}>
            {myRequests.filter(r => r.status === 'pending').map(req => (
              <Alert
                key={req.id}
                message={`Request to ${req.retailerName}`}
                description={`Sent on ${new Date(req.createdAt).toLocaleDateString()}. Waiting for retailer approval.`}
                type="warning"
                showIcon
                action={
                  <Button size="small" danger onClick={() => handleCancelRequest(req.id)}>
                    Cancel
                  </Button>
                }
              />
            ))}
          </Space>
        </Card>
      )}

      <Card>
        <Space style={{ marginBottom: 16 }}>
          <Input
            placeholder="Search retailers..."
            prefix={<SearchOutlined />}
            value={search}
            onChange={e => setSearch(e.target.value)}
            style={{ width: 300 }}
          />
        </Space>

        {loading ? (
          <div style={{ textAlign: 'center', padding: 48 }}>
            <Spin size="large" />
          </div>
        ) : retailers.length === 0 ? (
          <Empty description="No retailers found" />
        ) : (
          <Table
            columns={columns}
            dataSource={retailers}
            rowKey="id"
            pagination={{ pageSize: 10 }}
          />
        )}
      </Card>

      {/* View Retailer Modal */}
      <Modal
        title={
          <Space>
            <ShopOutlined />
            {selectedRetailer?.shopName}
          </Space>
        }
        open={viewModalVisible}
        onCancel={() => {
          setViewModalVisible(false);
          setSelectedRetailer(null);
        }}
        footer={[
          <Button key="close" onClick={() => setViewModalVisible(false)}>
            Close
          </Button>,
          !selectedRetailer?.isLinked && !currentLinkedId && selectedRetailer?.requestStatus !== 'pending' && (
            <Button
              key="request"
              type="primary"
              icon={<SendOutlined />}
              onClick={() => {
                setViewModalVisible(false);
                setRequestModalVisible(true);
              }}
            >
              Send Link Request
            </Button>
          ),
        ]}
        width={600}
      >
        {selectedRetailer && (
          <Descriptions bordered column={1}>
            <Descriptions.Item label="Shop Name">
              {selectedRetailer.shopName}
              {selectedRetailer.isVerified && (
                <Tag color="green" style={{ marginLeft: 8 }}>Verified</Tag>
              )}
            </Descriptions.Item>
            <Descriptions.Item label="Phone">
              {selectedRetailer.phone || '-'}
            </Descriptions.Item>
            <Descriptions.Item label="Email">
              {selectedRetailer.email || '-'}
            </Descriptions.Item>
            <Descriptions.Item label="Address">
              {selectedRetailer.address || '-'}
            </Descriptions.Item>
            <Descriptions.Item label="Products Available">
              {selectedRetailer.productCount}
            </Descriptions.Item>
            <Descriptions.Item label="Link Status">
              {getStatusTag(selectedRetailer)}
            </Descriptions.Item>
          </Descriptions>
        )}
      </Modal>

      {/* Send Request Modal */}
      <Modal
        title="Send Link Request"
        open={requestModalVisible}
        onCancel={() => {
          setRequestModalVisible(false);
          setRequestMessage('');
        }}
        onOk={handleSendRequest}
        confirmLoading={sendingRequest}
        okText="Send Request"
      >
        <Space direction="vertical" style={{ width: '100%' }}>
          <Alert
            message="Request to link with"
            description={selectedRetailer?.shopName}
            type="info"
          />
          <TextArea
            placeholder="Add a message for the retailer (optional)"
            value={requestMessage}
            onChange={e => setRequestMessage(e.target.value)}
            rows={4}
          />
          <Text type="secondary">
            Once your request is approved, you will be able to view products and place orders from this retailer.
          </Text>
        </Space>
      </Modal>
    </div>
  );
};

export default RetailerDiscoveryPage;
